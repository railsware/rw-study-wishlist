namespace :deploy do 
  desc "Full deploy"
  task :default do
    top.deploy.update_code
    top.symlinks.all
    top.deploy.migrate

    top.deploy.symlink

    top.passenger.restart

    top.deploy.cleanup
  end
end
