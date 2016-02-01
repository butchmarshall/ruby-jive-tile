module Jive
	module Tile
		class OauthToken < ActiveRecord::Base
			self.table_name = :jive_tiles_oauth_tokens
			has_one :tile, :class_name => "Jive::Tile::Model", :foreign_key => :jive_tiles_oauth_token_id
		end
	end
end
