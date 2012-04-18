namespace :crontab do

  desc "Replace crontab"
  task :replace, :roles => :crontab do
    run "crontab #{current_path}/config/crontab/crontab"
  end

  desc "Reset crontab"
  task :reset, :roles => :crontab do
    run "crontab -r"
  end

end