module Jive
	module Tile
		class Model < ActiveRecord::Base
			belongs_to :add_on, :class_name => "Jive::AddOn::Model"
			self.table_name = :jive_tiles
		end
	end
end
