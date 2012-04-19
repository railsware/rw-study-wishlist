namespace :deploy do 
  desc "Full deploy"
  task :default do
    transaction do
      top.deploy.update_code
      top.symlinks.all
      top.deploy.assets.precompile
      top.deploy.migrate

      top.deploy.symlink

      top.deploy.cleanup
    end
    top.passenger.restart
  end
end
