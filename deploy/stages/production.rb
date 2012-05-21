set :default_branch, "dev"
set :deploy_to, "/var/www/#{application}/production/"
set :rails_env, "production"

set :host, 'wishlist.rw.rw'
role :app, host
role :web, host
role :db,  host, :primary => true
