namespace :example do

  desc "install application"
  task :install do
    setup.user
    iptables.setup
    ntp.install
    ruby.install
    mysql.install
    deploy.setup
    deploy.update
    setup.db
    deploy.migrate
    unicorn.setup
    nginx.install
  end

  namespace :setup do

    desc "setup user"
    task :user, :roles => [:web] do
      home_dir = "/var/#{rails_user}"
      ssh_dir = "#{ home_dir}/.ssh"

      run "useradd -u 1001 -d #{home_dir} rails"
      upload "#{CapExample::local_dir}/keys/id_rsa.pub", "/tmp/id_rsa.pub"
      run "mkdir -p #{ssh_dir}"
      run "chmod 700 #{ssh_dir}"
      run "cat /tmp/id_rsa.pub >> #{ssh_dir}/authorized_keys"
      run "chmod 600 #{ssh_dir}/authorized_keys"
      run "rm -f /tmp/id_rsa.pub"
      run "chown -R #{rails_user}:#{rails_user} #{ssh_dir}"
    end

    desc "setup db"
    task :db, :roles => [:web] do
      upload "#{CapExample::local_dir}/files/application/database.yml", "#{current_path}/config/database.yml"
      run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake db:create"
    end

  end

end
