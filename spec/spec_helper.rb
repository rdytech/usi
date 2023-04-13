require 'simplecov'
SimpleCov.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter
]

SimpleCov.configure do
  add_filter '/spec/'
end

require 'bundler/setup'
Bundler.require(:default, :development)

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding perf: true
  config.order = 'random'
end
