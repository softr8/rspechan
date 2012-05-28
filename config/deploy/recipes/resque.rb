namespace :resque do
  desc 'enqueues all specs'
  task :enqueue_specs, role: :resque_master do
    run "cd #{current_release} && REDIS_HOSTNAME=#{redis_hostname} bundle exec rake resque:enqueue_specs"
  end

  task :start_workers, role: :app do
    run "cd #{current_release} && RAILS_ENV=test QUEUE=#{application} APPLICATION_NAME=#{application} REDIS_HOSTNAME=#{redis_hostname} bundle exec resque:work &2>1 > #{shared_path}/log/resque_workers.log &"
  end
end