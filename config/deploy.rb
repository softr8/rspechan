require 'bundler/setup'
Bundler.setup

require 'active_support/all'
require 'active_record'
require 'state_machine'


Dir["#{File.dirname(__FILE__)}/deploy/support/*.rb"].each { |fn| require fn }
Dir["#{File.dirname(__FILE__)}/../app/models/*.rb"].each { |fn| require fn }

require "rvm/capistrano"
require "bundler/capistrano"

@project = Project.find_by_id(ENV['PROJECT_ID'])
raise 'PROJECT NOT FOUND' unless @project

set :application, @project.name.gsub(' ', '_')
set :repository,  @project.repo
set :user, 'rspechan'
set :user, 'vagrant'
set :use_sudo,    false
set :deploy_to,   "/home/#{user}/app_#{application}"

set :scm, :git

set :rvm_ruby_string, @project.ruby_version
set :rvm_type, :user


set :bundle_without, []
set :bundle_flags, ''

Dir["#{File.dirname(__FILE__)}/deploy/recipes/*.rb"].each { |fn| load fn }


@nodes = Node.availables
#role :web  # we dont want assets
role :app, *@nodes #all nodes
role :db,  *@nodes, :primary => true # Migrations are run un all nodes

after 'deploy:setup', 'deploy:custom:setup'

namespace :build do
  task :default do
    rvm.create_gemset
    rvm.install_bundler
    deploy.update_code
    deploy.symlink
    db.create rescue nil
    db.migrate
    #resque:start_client
  end
end

namespace :provision do
  task :default, role: :ap do
    rvm.install
    rvm.install_ruby
    rvm.install_bundler rescue nil
    rvm.create_gemset
    deploy.setup
  end
end

namespace :deploy do
  namespace :custom do
    task :setup do
      run "cd #{shared_path} && mkdir -p bundle"
    end
  end
end