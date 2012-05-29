namespace :db do
  task :symlink, role: :app do
    require 'erb'

    template = File.read("./config/deploy/templates/db/#{db_type}.yml.erb")
    result = ERB.new(template).result(binding)

    put result, "#{current_path}/config/database.yml", :mode => 0644
    #run "cd #{current_release}/config && if [ ! -e database.yml ] ; then if [ -e database.yml.example ] ; then echo 'Symlinking .example files' ; ln -sf database.yml.example database.yml ; fi ; fi"
  end

  task :sanitize_gemfile do
    run %Q{cd #{current_release} && sed -i "/mysql2/d" Gemfile && echo "gem '#{db_type}'" >> Gemfile}
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