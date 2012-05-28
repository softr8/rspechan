namespace :db do
  task :symlink, role: :app do
    run "cd #{current_release}/config && if [ ! -e database.yml ] ; then if [ -e database.yml.example ] ; then echo 'Symlinking .example files' ; ln -sf database.yml.example database.yml ; fi ; fi"
  end

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