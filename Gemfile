source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'mysql2'



gem 'jquery-rails'
gem "whenever"
gem "js-routes", :git => "https://github.com/railsware/js-routes"
gem "haml-rails"
gem "will_paginate"


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier', ">= 1.0.3"
end

group :test do
  gem "rspec-rails"
  gem 'factory_girl'
  gem "factory_girl_rails"
  gem "accept_values_for"
  gem 'fakeweb'
end

group :development do
  gem "annotate", :require => false
  gem "thin", :require => false
end

group :staging do
end

group :deploy do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'capistrano_colors'
  gem 'capistrano-uptodate'
  gem 'rvm-capistrano'
end
