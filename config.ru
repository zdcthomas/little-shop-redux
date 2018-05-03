require 'bundler'
Bundler.require

require File.expand_path('../config/environment', __FILE__)
# exec 'export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES'

run LittleShopApp
