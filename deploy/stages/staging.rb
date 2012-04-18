set :branch, ENV['BRANCH'] || "master"
set :deploy_to, "/var/www/#{application}/staging/"
set :rails_env, "staging"

set :host, 'wishlist.rw.rw'
role :app, host
role :web, host
role :db,  host, :primary => true
