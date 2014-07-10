module Usi
end

require "usi/version"
require "usi/validator"

if defined?(Rails)
  require "usi_validator"
end
