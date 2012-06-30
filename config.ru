# This file is used by Rack-based servers to start the application.
ENV['RAILS_ENV'] = ENV['RACK_ENV']  if !ENV['RAILS_ENV'] && ENV['RACK_ENV'] 

require 'resque/server'  
run Rack::URLMap.new "/" => Wishlist::Application,  "/resque" => Resque::Server.new

require ::File.expand_path('../config/environment',  __FILE__)
run Wishlist::Application

