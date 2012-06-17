namespace :rspechan do
  task :add_rspechan_tasks do
    concatenates = {
      "require 'rspechan_worker'" => 'Rakefile',
      "require 'tr8sque/tasks'" => 'Rakefile',
      "gem 'tr8sque', git: 'https://github.com/softr8/resque.git', branch: 'tr8sque'" => 'Gemfile',
      "gem 'tr8dis', git: 'https://github.com/softr8/redis-rb.git', branch: 'tr8dis'" => 'Gemfile',
      "gem 'rspechan_worker', git: 'git@github.com:crowdint/rspechan_worker.git'" => 'Gemfile'
    }
    run "cd #{current_release} && #{concatenates.collect {|key, value| "echo \"#{key}\" >> #{value}"}.join(' && ')}"
  end
end