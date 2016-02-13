require 'rails/generators/base'
require 'jive/tile/compatibility'

module Jive
	class Tile < ActiveRecord::Base
		class Generator < Rails::Generators::Base
			source_paths << File.join(File.dirname(__FILE__), 'templates')
		end
	end
end

