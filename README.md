# USI

[![Code Climate](https://codeclimate.com/github/jobready/usi.png)](https://codeclimate.com/github/jobready/usi)
[![Build Status](https://travis-ci.org/jobready/usi.svg)](https://travis-ci.org/jobready/usi)

A gem for validating USI (Unique Student Identifiers)

## Installation

Add this line to your application's Gemfile:

    gem 'usi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usi

## Usage

```ruby
require 'usi'

Usi::Validator.new("123456789X").valid?

```

or in Rails

```ruby
class Student < ActiveRecord::Base
  validates :idenfier, usi: true
end
```

## Contributing

1. Fork it ( http://github.com/jobready/usi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

