set :application, "example"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :none
set :repository, "#{CapExample::local_dir}/files/example"

set :deploy_via, :copy
set :deploy_to, "/var/rails/#{application}"
set :copy_remote_dir, deploy_to
set :use_sudo, false
set :user, "root"
set :rails_user, "rails"
set :normalize_asset_timestamps, false
#set :bundle_flags, "--deployment --quiet --local"
set :bundle_flags, "--deployment --local"
ssh_options[:keys] = %w(./keys/id_rsa)

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
