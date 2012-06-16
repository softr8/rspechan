require 'bundler/setup'
Bundler.setup

require 'active_support/all'
require 'active_record'
require 'state_machine'

require "#{File.dirname(__FILE__)}/../lib/organization_helper"

Dir["#{File.dirname(__FILE__)}/deploy/support/*.rb"].each { |fn| require fn }
Dir["#{File.dirname(__FILE__)}/../app/models/*.rb"].each { |fn| require fn }

require "rvm/capistrano"
require "bundler/capistrano"

_cset :project_id, 1
_cset :organization_id, 1
_cset :build_id, 1
_cset :main_app_url, "http://33.33.33.1" #TODO, move this to an admin interface

puts "#{project_id}, #{organization_id}, #{build_id}"

OrganizationHelper.default_id = organization_id
@project = Project.find_by_id(project_id)
raise "PROJECT NOT FOUND #{project_id}" unless @project

set :application, @project.name.gsub(' ', '_')
set :repository,  @project.repo
set :branch, @project.branch || 'master'
set :user, 'rspechan'
set :user, 'vagrant'
set :use_sudo,    false
set :deploy_to,   "/home/#{user}/app_#{application}"

set :scm, :git
set :deploy_via,  :remote_cache

set :rvm_ruby_string, "#{@project.ruby.name}@#{application}"
set :rvm_type, :user


set :bundle_without, []
set :bundle_flags, ''
set :db_type, 'sqlite3'

Dir["#{File.dirname(__FILE__)}/deploy/recipes/*.rb"].each { |fn| load fn }


@nodes = Node.availables
#role :web  # we dont want assets
role :app, *@nodes  #all nodes
set :num_workers, @nodes.count
role :db,  *@nodes, primary: true  # Migrations are run un all nodes
role :resque_master,  @nodes.first

set :redis_hostname, "#{@nodes.first}:6379"

after 'deploy:setup', 'deploy:custom:setup'
before "deploy:finalize_update", "db:sanitize_gemfile"

namespace :build do
  task :default do
    rvm.create_gemset
    rvm.install_bundler
    deploy.setup
    deploy.update_code
    deploy.create_symlink
    db.symlink
    db.create rescue nil
    db.migrate
    db.test_prepare
    utils.write_app_name
    tr8sque.enqueue_specs
    tr8sque.start_workers
  end
end

namespace :provision do
  task :default, role: :app do
    rvm.install
    rvm.install_all_rubies
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
