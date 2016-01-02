module Jive
	module Tile
		class OauthToken < ActiveRecord::Base
			self.table_name = :jive_tiles_oauth_tokens
			has_one :tile, :class_name => "Jive::Tile::Model"
		end
	end
end
