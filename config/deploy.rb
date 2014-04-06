lock '3.1.0'

set :application, 'miserapi'
set :repo_url, 'git@github.com:cintrzyk/miserapi.git'

set :rbenv_custom_path, '/usr/local/rbenv'
set :rbenv_ruby, '2.1.1'

set :pty, true
set :sudo_prompt, ""
set :linked_files, %w{ config/monogid.yml }
set :linked_dirs, %w{ tmp/pids log }
set :deploy_to, "/home/#{fetch(:application)}/production"
set :scm, :git

namespace :deploy do

  task :setup_config do
    on roles(:app) do
      sudo "ln -nfs #{current_path}/config/nginx.production.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
    end
  end
  after :finishing, :setup_config

  %w{start stop restart}.each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app) do
        sudo "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
        execute 'service nginx restart'
      end
    end
  end
  after :setup_config, :restart

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:web) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end
  before :starting, :check_revision
end
