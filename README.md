[![Gem Version](https://badge.fury.io/rb/jive-tile.svg)](http://badge.fury.io/rb/jive-tile)
[![Build Status](https://travis-ci.org/butchmarshall/ruby-jive-tile.svg?branch=master)](https://travis-ci.org/butchmarshall/ruby-jive-tile)

# Jive::Tile

An implemention of Jives Tiles using ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jive-tile'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jive-tile

then run

```ruby
rails generate jive:add_on:active_record
rails generate jive:tile:active_record
```

## Usage

To the ActiveRecord model:

```ruby
Jive::Tile.new(...)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/butchmarshall/ruby-jive-tile.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

