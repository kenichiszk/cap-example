role :app, "192.168.1.10", :user => rails_user
role :proxy, "192.168.1.10", :no_release => true
role :web, "192.168.1.10", :no_release => true
role :db, "192.168.1.10", {:primary => true, :no_release => true}

set :ntp_server, "ntp.jst.mfeed.ad.jp"
set :unicorn_port, 3100
set :unicorn_pid_dir, "tmp/pids"
set :unicorn_log_dir, "log"
