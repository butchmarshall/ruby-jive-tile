module Jive
	module Tile
		module AddOn
			module Model
				module ClassMethods
					def self.included(base)
						base.class_eval do
							has_many :tiles, :class_name => "Jive::Tile::Model"
						end
					end
				end
			end
		end
	end
end
