# USI

[![Code Climate](https://codeclimate.com/github/jobready/usi.png)](https://codeclimate.com/github/jobready/usi)
[![Build Status](https://travis-ci.org/jobready/usi.svg)](https://travis-ci.org/jobready/usi)

A gem for validating USI (Unique Student Identifiers) for VET Students in Australia

From the Department of Industry's website -

    USI is effectively an account or reference number made up of numbers and letters.  The USI will allow all of an individual’s training records, entered in the national vocational education and training (VET) data collection, to be linked.
    The USI will be available online and at no cost to the student. This USI will stay with the student for life and be recorded with any nationally recognised VET course that is undertaken from when the USI comes into effect.


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

Usi::Validator.new('223456789N').valid?

```

in Rails 3+

```ruby
class Student < ActiveRecord::Base
  validates :identifier, usi: true
end
```

in Rails 2.3

```ruby
class Student < ActiveRecord::Base
  validate :must_be_valid_format_usi

  def must_be_valid_format_usi
    errors.add_to_base('USI format invalid') unless Usi::Validator.new(usi).valid?
  end
end
```

## Contributing

1. Fork it ( http://github.com/jobready/usi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

