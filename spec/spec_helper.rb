# spec/spec_helper.rb

require 'rspec'

# Add any other configuration or setup here

RSpec.configure do |config|
    config.expect_with(:rspec) { |c| c.syntax = :should }
    # Add any other configuration or setup here
end