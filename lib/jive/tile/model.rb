module Jive
	module Tile
		class Model < ActiveRecord::Base
			self.table_name = :jive_tiles
			belongs_to :add_on, :class_name => "Jive::AddOn::Model", :foreign_key => :jive_add_on_id
			has_one :oauth_token, :class_name => "Jive::OauthToken::Model", :as => :owner
			serialize :config, Hash

			after_create :fetch_oauth_token

			private
				def fetch_oauth_token
					require "open-uri"
					require "net/http"
					require "openssl"

					return if self.add_on.nil?

					uri = URI.parse("#{self.add_on.jive_url}/oauth2/token")
					http = Net::HTTP.new(uri.host, uri.port)
					http.use_ssl = true

					request = Net::HTTP::Post.new(uri.request_uri)

					request["Content-Type"] = "application/x-www-form-urlencoded"
					request.basic_auth(self.add_on.client_id, self.add_on.client_secret)
					request.set_form_data({
						"code" => self.code,
						"grant_type" => "authorization_code",
						"client_id" => self.add_on.client_id,
					})

					response = http.request(request)

					# Got access token from Jive
					if (response.code.to_i === 200)
						json_body = JSON.parse(response.body)

						# Create
						Jive::OauthToken::Model.create(
							:owner => self,
							:scope => json_body["scope"],
							:token_type => json_body["token_type"],
							:expires_in => json_body["expires_in"],
							:expires_at => json_body["expires_in"].to_i.seconds.from_now,
							:refresh_token => json_body["refresh_token"],
							:access_token => json_body["access_token"],
						)
					end
				end
		end
	end
end