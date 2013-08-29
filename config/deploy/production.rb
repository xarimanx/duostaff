set :deploy_to, "/var/www/apps/duostaff"
set :rails_env, 'production'
set :branch, 'r0'

set :host, '146.185.130.177'
set :user, 'deploy'

set :unicorn_conf, "/etc/unicorn/duostaff.rb"

namespace :db do
  desc "default in shared path"
  task :default do
    run "mkdir -p #{shared_path}/backups/db_backups"
  end
end
