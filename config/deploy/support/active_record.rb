RAILS_ENV = ENV['RAILS_ENV']|| 'development'

db_config = HashWithIndifferentAccess.new(YAML::load(IO.read('config/database.yml'))[RAILS_ENV])

ActiveRecord::Base.establish_connection(db_config)
