#TODO: by some reason task name :rake breaks everything
desc "Run rake task on remote server. Set TASK variable to rake task name."
task :rrake do
  run_rake ENV['TASK']
end

def run_rake(*tasks)
  rails_env = fetch(:rails_env, "production")
  rake = fetch(:rake, "rake")
  tasks.each do |t|
    run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} #{t}"
  end
end
