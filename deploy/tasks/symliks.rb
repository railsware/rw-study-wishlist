namespace :symlinks do
  task :all, :roles => :app do
    run "ln -s #{release_path}/config/database.yml.deploy #{release_path}/config/database.yml"
  end
end