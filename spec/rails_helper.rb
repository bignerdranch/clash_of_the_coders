ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'
require 'capybara/rails'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Because Capybara runs in a separate thread with a different database
  # connection, feature specs cannot use a transaction.
  config.before(type: :feature) do
    DatabaseCleaner.strategy = :truncation
  end

  # Reset so other non-feature specs don't have to deal with slow truncation.
  config.after(type: :feature) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  include ClashOfTheCoders::CapybaraHelpers
  include ClashOfTheCoders::NavigationHelpers

  Capybara.javascript_driver = :poltergeist
end

