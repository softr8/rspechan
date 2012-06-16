module Async
  class Deploy
    @logger = Logger.new('log/builder.log')

    @queue = 'deploy'

    def self.perform *args
      project_id = args.first["project_id"]
      build_id = args.first["build_id"]
      organization_id = args.first["organization_id"]
      if system("cap build -Sproject_id=#{project_id} -Sbuild_id=#{build_id} -Sorganization_id=#{organization_id}")
        Build.find(args.second).deployed
      else
        Build.find(args.second).failed
      end
    end
  end
end