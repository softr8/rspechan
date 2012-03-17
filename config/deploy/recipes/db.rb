namespace :db do
  task :create, role: :db, primary: true do
    run "cd #{current_release} && bundle exec rake db:create:all"
  end

  task :migrate, role: :db, primary: true do
    run "cd #{current_release} && bundle exec rake db:migrate"
  end

  task :test_prepare, role: :app do
    run "cd #{current_release} && bundle exec rake db:test:prepare"
  end
end