require 'soprano'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require "whenever/capistrano"
require 'new_relic/recipes'

set :default_environment, {
  'PATH' => "/home/deploy/.rbenv/shims:/home/deploy/.rbenv/bin:$PATH"
}

set :application, 'duostaff'
set :web_server, :nginx
set :keep_releases, 3

set :repository, 'git@github.com:xarimanx/duostaff.git'
set :deploy_to, "/var/www/apps/#{application}"
set :deploy_via, :copy
set :copy_exclude, %w(.git .idea .yardoc tmp log .DS_Store doc/* public/uploads.tar db/*.sql vendor/cache)
set :copy_cache, true

set :bundle_without, [:development, :test]
set :bundle_flags, "--deployment --binstubs"

set :user, 'deploy'

set :newrelic_revision do
  self[:current_revision]
end
after "deploy:update", "newrelic:notice_deployment"

set :whenever_environment, defer { stage }
set :whenever_command, "bundle exec whenever"
set :whenever_identifier, defer { "#{application}_#{stage}" }

before "deploy:setup", :db
after "deploy:update_code", "db:symlink"
after "deploy:create_symlink", "utils:version"
after "deploy:update_code", "update_patient_yml"

task :update_patient_yml do
  run "cd #{release_path}; RAILS_ENV=#{stage} bundle exec rake do_patients:create_patients_list_yaml"
end

namespace :deploy do
  desc "Start application."
  task :start, :roles => :app do
    run "sudo service unicorn start"
  end

  desc "Stop application."
  task :stop, :roles => :app do
    run "sudo service unicorn stop"
  end

  desc "Restart application."
  task :restart, :roles => :app do
    run "sudo service unicorn restart"
  end
end

namespace :utils do
  task :version do
    run "cd #{fetch(:latest_release)} && echo #{fetch(:branch)} > APP_VERSION"
  end
end

namespace :db do
desc "Make symlinks"
  task :symlink do
    run "ln -nfs #{shared_path}/backups #{release_path}/backups"
  end
end
