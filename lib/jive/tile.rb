require "active_support"
require "active_support/dependencies"
require "active_record"

require "jive/oauth_token"
require "jive/add_on"
require "jive/tile/add_on/class_methods"

require "jive/tile/version"
require "jive/tile/compatibility"
require "jive/tile/class_methods"
require "jive/tile/instance_methods"

module Jive
	class Tile < ActiveRecord::Base
	end
end

Jive::Tile.send :include, Jive::Tile::InstanceMethods
Jive::Tile.send :extend, Jive::Tile::ClassMethods

# We want add-ons to know they can now associate with Tiles
Jive::AddOn.send :include, Jive::Tile::AddOn::ClassMethods