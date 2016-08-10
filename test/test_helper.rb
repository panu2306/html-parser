ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
SimpleCov.start

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }
class ActiveSupport::TestCase
  DatabaseCleaner.strategy = :truncation
  # then, whenever you need to clean the DB
  DatabaseCleaner.clean
  require "#{Rails.root}/db/seeds.rb"
end
