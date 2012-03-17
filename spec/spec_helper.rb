require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'ap'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}

  if ENV["RUBYMINE_HOME"]
    $:.unshift(File.expand_path("rb/testing/patch/common", ENV["RUBYMINE_HOME"]))
    $:.unshift(File.expand_path("rb/testing/patch/bdd", ENV["RUBYMINE_HOME"]))
  end

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false

    config.before(:all) do
      require "#{Rails.root.join('db/seeds')}"
    end
  end
end

Spork.each_run do
end
