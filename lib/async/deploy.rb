module Async
  class Deploy
    @logger = Logger.new('log/builder.log')

    @queue = 'deploy'

    def self.perform *args
      project_id = args.first["project_id"]
      build_id = args.first["build_id"]
      organization_id = args.first["organization_id"]
      if system("cap build -sproject_id=#{project_id} -sbuild_id=#{build_id} -sorganization_id=#{organization_id}")
        Build.find(args.second).deployed
      else
        Build.find(args.second).failed
      end
    end
  end
end