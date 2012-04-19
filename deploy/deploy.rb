set :stages, %w(staging)
set :stage_dir, "deploy/stages"

require 'rvm/capistrano'
require 'capistrano_colors'
require 'capistrano/ext/multistage'

set :application,  'wishlist'
set :host, 'wishlist.rw.rw'
set :repository, "git://github.com/railsware/rw-study-wishlist.git"
set :user, "whishlist"
set :rvm_ruby_string, '1.9.3'
#set :rvm_type, :system

role :app, host
role :web, host
role :crontab, host
role :db,  host, :primary => true

set :use_sudo, true

set :scm, :git
set :keep_releases, 5

set :ssh_options, { 
  :user => 'whishlist',
  :forward_agent => true, 
  :auth_methods => %w(publickey), 
  :port => 22108, 
  :keys => [File.dirname(__FILE__) + "/keys/wishlist.pem"] 
  }


#after "deploy", "crontab:replace"

#require 'config/boot'
#require 'hoptoad_notifier/capistrano'

