require 'bundler/setup'
Bundler.setup

require 'active_support/all'
require 'active_record'
require 'state_machine'


Dir["#{File.dirname(__FILE__)}/deploy/support/*.rb"].each { |fn| require fn }
Dir["#{File.dirname(__FILE__)}/../app/models/*.rb"].each { |fn| require fn }

require "rvm/capistrano"
require "bundler/capistrano"

_cset :project_id, 0
@project = Project.find_by_id(project_id)
raise "PROJECT NOT FOUND #{project_id}" unless @project

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
    deploy.setup
    rvm.create_gemset
    rvm.install_bundler
    deploy.update_code
    deploy.symlink
    db.create rescue nil
    db.migrate
    utils.write_app_name
    #resque:enqueue_specs
    #resque:start_client
  end
end

namespace :provision do
  task :default, role: :app do
    rvm.install
    rvm.install_ruby
  end
end

namespace :deploy do
  namespace :custom do
    task :setup do
      run "cd #{shared_path} && mkdir -p bundle"
    end
  end
end

namespace :utils do
  task :write_app_name do
    run "echo #{application} > #{current_release}/APPLICATION_NAME"
  end
end