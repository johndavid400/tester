# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
require 'bundler/capistrano'

set :application, "staging.prototyperobotics.com"
role :web, "staging.prototyperobotics.com"                          # Your HTTP server, Apache/etc
role :app, "staging.prototyperobotics.com"                          # This may be the same as your `Web` server
role :db,  "staging.prototyperobotics.com", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/deployer/staging"
set :user, "deployer"
set :use_sudo, false

# repo details
set :scm, :git
#set :git_username, "johndavid400"
set :repository, "git@github.com:johndavid400/tester.git"
set :branch, "staging"
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler"

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
#    run "ln -nfs #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
