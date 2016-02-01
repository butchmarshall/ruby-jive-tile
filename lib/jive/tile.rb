require "active_support"
require "active_support/dependencies"
require "active_record"

require "jive/oauth_token"
require "jive/add_on"
require "jive/tile/add_on/class_methods"

require "jive/tile/version"
require "jive/tile/compatibility"
require "jive/tile/model"

module Jive
	module Tile
	end
end

# We want add-ons to know they can now associate with Tiles
Jive::AddOn::Model.send :include, Jive::Tile::AddOn::Model::ClassMethods