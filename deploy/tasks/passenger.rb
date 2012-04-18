namespace :passenger do
  desc "Restart Passenger"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  # desc "Stop Passenger"
  # task :stop, :roles => :app do
  #   run "touch #{current_path}/tmp/stop.txt"
  # end
  # 
  # desc "Start (or un-stop) Passenger"
  # task :start, :roles => :app do
  #   
  # end
end