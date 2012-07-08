role :worker, "update_user.wishlist.rw.rw"
role :worker, "update_friends.wishlist.rw.rw"
role :worker, "create_friends.wishlist.rw.rw"
load 'deploy' if respond_to?(:namespace) # cap2 differentiator
$:.push File.expand_path("../deploy/lib", __FILE__)
Dir['deploy/lib/*.rb'].each { |plugin| load(plugin) }
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
Dir['deploy/tasks/*.rb'].each { |plugin| load(plugin) }

load 'deploy/deploy.rb'
