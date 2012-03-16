module Async
  class Deploy
    @logger = Logger.new('log/builder.log')

    @queue = 'deploy'

    def self.perform *args
      if system("cap build -Sproject_id=#{args.first}")
        Build.find(args.second).deployed
      else
        Build.find(args.second).failed
      end
    end
  end
end