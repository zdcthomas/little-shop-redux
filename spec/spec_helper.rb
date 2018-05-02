ENV["RACK_ENV"] ||= "test"

require 'Bundler'
Bundler.require(:default, :test)
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
require 'capybara/dsl'

Capybara.app = LittleShopApp

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end