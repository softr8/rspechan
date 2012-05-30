source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'capistrano'
gem 'capistrano-ext'
gem "haml-rails"
gem 'jquery-rails'
gem 'mysql2'
gem 'tr8sque', git: 'git@github.com:softr8/resque.git', branch: 'tr8sque'
#gem 'tr8sque', path: '../tr8sque'
gem 'rspechan_worker', git: 'git@github.com:crowdint/rspechan_worker.git'
#gem 'rspechan_worker', path: '../rspechan_worker'
gem 'rvm'
gem 'state_machine'
gem 'unicorn'
gem 'resque'

group :assets do
  gem 'bootstrap-sass', '~> 2.0.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'autotest-rails'
  gem 'autotest-growl'
  gem 'awesome_print', require: 'ap'
  gem 'factory_girl'
  gem 'foreman'
  gem 'rspec-rails'
  gem 'spork'
end

group :test do
  gem 'resque_spec'
end

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
