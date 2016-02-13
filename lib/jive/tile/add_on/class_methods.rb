module Jive
	class Tile < ActiveRecord::Base
		module AddOn
			module ClassMethods
				def self.included(base)
					base.class_eval do
						has_many :tiles, :class_name => "Jive::Tile", :foreign_key => :jive_add_on_id
					end
				end
			end
		end
	end
end
