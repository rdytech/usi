module Usi
end

require 'usi/version'
require 'usi/luhn_check'
require 'usi/validator'
require 'usi_validator' if defined?(Rails) && defined?(ActiveModel)
