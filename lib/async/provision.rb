module Async
  class Provision
    @queue = :provision

    def self.perform *args
      if system("HOST='#{args.first}' cap provision ")
        Node.find(args.second).ready
      else
        Node.find(args.second).failed
      end
    end
  end
end