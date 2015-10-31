require 'GEM_NAME'
include GEM_NAMESPACE

require_relative 'support/simplecov' if ENV['COVERAGE']

RSpec.configure do |config|
  config.color = true
  config.use_transactional_examples = true

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
