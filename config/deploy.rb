require 'bundler/capistrano'
require 'rvm/capistrano'
require 'capistrano_colors'

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

set :application, "<FILL: APPLICATION-NAME-HERE>"
set :repository,  "<FILL: REPOSITORY-URL>"
set :branch, "master"

set :deploy_to, "/var/www/#{application}"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "<FILL: SSH USER>"

role :web, "<FILL: WEB-SERVER>" # Your HTTP server, Apache/etc
role :app, "<FILL: WEB-SERVER>" # This may be the same as your `Web` server
role :db,  "<FILL: DB-SERVER>", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :port, <FILL: PORT>

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

ssh_options[:forward_agent] = true
