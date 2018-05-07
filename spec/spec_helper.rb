ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'launchy'
require 'capybara/dsl'

Capybara.app = LittleShopApp
Capybara.save_path = 'tmp/capybara'
DatabaseCleaner.strategy = :truncation


DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
