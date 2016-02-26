module Jive
	class Tile < ActiveRecord::Base
		module InstanceMethods
			def self.included(base)
				base.table_name = "jive_tiles"
			end

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
						oauth_token = Jive::OauthToken.create(
							:owner => self,
							:add_on => self.add_on,
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