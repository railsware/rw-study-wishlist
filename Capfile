load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
Dir['deploy/tasks/*.rb'].each { |plugin| load(plugin) }
require './deploy/lib/rvm.rb'
load 'deploy/deploy.rb'
