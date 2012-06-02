set :stages, %w(production)
set :stage_dir, "deploy/stages"

require 'rvm/capistrano'
require "bundler/capistrano"
require 'capistrano_colors'
require 'capistrano/ext/multistage'

set :application,  'wishlist'
set :host, 'wishlist.rw.rw'
set :repository, "git://github.com/railsware/rw-study-wishlist.git"
set :user, "whishlist"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :system
set :bundle_flags,    "--deployment"
set :normalize_asset_timestamps, false


role :app, host
role :web, host
role :crontab, host
role :db,  host, :primary => true

set :use_sudo, true

set :scm, :git
set :keep_releases, 5

set(:branch) {Utils::CLI.ask_branch_name(default_branch)}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#after "deploy", "crontab:replace"

#require 'config/boot'
#require 'hoptoad_notifier/capistrano'
