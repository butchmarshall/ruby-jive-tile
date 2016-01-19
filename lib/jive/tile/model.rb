module Jive
	module Tile
		class Model < ActiveRecord::Base
			belongs_to :add_on, :class_name => "Jive::AddOn::Model", :foreign_key => :jive_add_on_id
			self.table_name = :jive_tiles
			serialize :config, Hash
		end
	end
end