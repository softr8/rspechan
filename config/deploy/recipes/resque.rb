namespace :resque do
  desc 'enqueues all specs'
  task :enqueue_specs, role: :resque_master do
    run "cd #{current_release} && REDIS_HOSTNAME=#{redis_hostname} APPLICATION_NAME=#{application} bundle exec rake rspechan:enqueue_specs"
  end

  task :start_workers, role: :app do
    run "cd #{current_release} && RAILS_ENV=test QUEUE=queue_#{application} APPLICATION_NAME=#{application} REDIS_HOSTNAME=#{redis_hostname} BUILD_ID=#{build_id} DUMP_FAILURES_URL=#{main_app_url}  bundle exec rake environment tr8sque:work 2>&1 >> #{shared_path}/log/tr8sque_workers.log &"
  end
end