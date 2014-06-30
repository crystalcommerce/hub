require 'vlad/assets'
# Bundler ships with vlad integration you'll have to require
# in order to use the vlad:bundle tasks
require 'bundler/vlad'

# Require custom vlad tasks or recipes from vlad-extras
require 'vlad/maintenance'

set :user, "deploy"
# set :domain, "54.184.20.253"
set :application, "hub"
set :deploy_to, "/var/www/hub"
set :repository, "git@github.com:crystalcommerce/hub.git"
set :bundle_without, [:development, :test]
set :revision,   ENV['branch'] ? "origin/#{ENV['branch']}" : "origin/master"
set :bundle_cmd, "/usr/local/rvm/wrappers/ruby-2.1.1/bundle"
set :rake_cmd, "#{bundle_cmd} exec rake"

host "deploy@54.244.248.113", :web, :app

set :shared_paths, {
  'pids'                  => 'tmp/pids',
  'log'                   => 'log',
  'assets'                => 'public/assets',
  'config/database.yml'   => 'config/database.yml',
  'secrets.yml'           => 'config/secrets.yml'
}

desc "Symlinks the configuration files"
namespace :vlad do
  remote_task :deploy => [
    'vlad:maintenance:on',
    :update,
    'vlad:bundle:install',
    'vlad:assets:precompile',
    :migrate,
    :start_app,
    'vlad:maintenance:off',
    :cleanup
  ]
end
