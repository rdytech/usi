# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usi/version'

Gem::Specification.new do |spec|
  spec.name          = "usi"
  spec.version       = Usi::VERSION
  spec.authors       = ["John D'Agostino"]
  spec.email         = ["john.dagostino@gmail.com"]
  spec.summary       = %q{Validate Australian Government USI}
  spec.description   = %q{A gem for validating Australian Government Unique Student Identifiers (USI)}
  spec.homepage      = "https://github.com/jobready/usi"
  spec.license       = "MIT"

  spec.required_rubygems_version = '>= 1.3.6'

  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'cane', '~> 2.6'
  spec.add_development_dependency 'byebug', '~> 2.7'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'coveralls'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end

