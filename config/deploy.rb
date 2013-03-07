require 'bundler/capistrano'
load 'deploy/assets'

set :application, "rails3demo"
set :bundle_flags, "--deployment --quiet --binstubs"
set :default_environment, {
    'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
set :rails_env, :production
set :deploy_to, "/home/www/apps/rails3demo"
set :repository,  "git://github.com/josemota/rails3demo"
set :user, "www"
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "192.168.1.82", :web, :app, :db, primary: true

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

namespace :deploy do
  task :start do
    run "cd #{deploy_to}/current; bundle exec rails s -d"
  end
end
