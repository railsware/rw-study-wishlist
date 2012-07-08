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

after "deploy:symlink", "deploy:restart_workers"

	
##
# Rake helper task.
# http://pastie.org/255489
# http://geminstallthat.wordpress.com/2008/01/27/rake-tasks-through-capistrano/
# http://ananelson.com/said/on/2007/12/30/remote-rake-tasks-with-capistrano/
def run_remote_rake(rake_cmd)
  rake_args = ENV['RAKE_ARGS'].to_s.split(',')

  cmd = "cd #{fetch(:latest_release)} && bundle exec #{fetch(:rake, "rake")} RAILS_ENV=#{fetch(:rails_env, "production")} #{rake_cmd}"
  cmd += "['#{rake_args.join("','")}']" unless rake_args.empty?
  run cmd
  set :rakefile, nil if exists?(:rakefile)
end

namespace :deploy do
  desc "Restart Resque Workers"
  task :restart_workers, :roles => :worker do
    run_remote_rake "resque:restart_workers"
  end
end

#after "deploy", "crontab:replace"

#require 'config/boot'
#require 'hoptoad_notifier/capistrano'
