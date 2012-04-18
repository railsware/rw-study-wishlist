namespace :bundle do
  task :install, :except => { :no_release => true } do
    sudo "bundle install --gemfile #{current_path}/Gemfile --path #{shared_path}/bundle #{fetch(:bundle_flags,'')}", :as => user
  end
end