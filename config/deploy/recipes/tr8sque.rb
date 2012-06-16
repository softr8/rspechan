namespace :tr8sque do
  desc 'enqueues all specs'
  task :enqueue_specs, role: :resque_master do
    run "cd #{current_release} && NUM_WORKERS=#{num_workers} REDIS_HOSTNAME=#{redis_hostname} APPLICATION_NAME=#{application} REDIS_HOSTNAME=#{redis_hostname} bundle exec rake rspechan:enqueue_specs"
  end

  task :start_workers, role: :resque_master do
    run "cd #{current_release} && QUEUE=queue_#{application} APPLICATION_NAME=#{application} REDIS_HOSTNAME=#{redis_hostname} BUILD_ID=#{build_id} DUMP_FAILURES_URL=#{main_app_url}  bundle exec rake rspechan:start_workers 2>&1 >> #{shared_path}/log/tr8sque_workers.log &"
  end

  task :stop_workers, role: :app do
    run "for i in `ps -A -o pid,command | egrep 'resque-[0-9]+.[0-9]+.[0-9]+' | grep -v grep | awk '{print $1}'` ; do kill -QUIT $i ; done"
  end
end