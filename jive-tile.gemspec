# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jive/tile/version'

Gem::Specification.new do |spec|
	spec.name          = "jive-tile"
	spec.version       = Jive::Tile::VERSION
	spec.authors       = ["Butch Marshall"]
	spec.email         = ["butch.a.marshall@gmail.com"]
	spec.summary       = "Jive Tile functionality implemented using ActiveRecord."
	spec.description   = "Implements the functionality required for dealing with and storing Jive Tiles using ActiveRecord as a storage backend."
	spec.homepage      = "https://github.com/butchmarshall/ruby-jive-tile"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
	spec.bindir        = "exe"
	spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
	spec.require_paths = ["lib"]

	spec.add_dependency "activerecord", [">= 3.0", "< 5.0"]

	# Tiles require association with an AddOn
	spec.add_dependency "jive-add_on", ">= 0.0.2"
	spec.add_dependency "jive-oauth_token", ">= 0.0.4"

	if RUBY_PLATFORM == 'java'
		spec.add_development_dependency "jdbc-sqlite3", "> 0"
		spec.add_development_dependency "activerecord-jdbcsqlite3-adapter", "> 0"
	else
		spec.add_development_dependency "sqlite3", "> 0"
	end

	spec.add_development_dependency "database_cleaner"
	spec.add_development_dependency "factory_girl", "> 4.0"
	spec.add_development_dependency "bundler", "~> 1.7"
	spec.add_development_dependency "rake", "~> 10.0"

	spec.add_development_dependency "rspec"
	spec.add_development_dependency "webmock"
end
