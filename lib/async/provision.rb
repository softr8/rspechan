module Async
  class Provision
    @queue = :provision

    def self.perform *args
      node = Node.find(args.first)
      if system("HOSTS='#{args.ip}' cap provision")
        Node.find(args.second).ready
      else
        Node.find(args.second).failed
      end
    end
  end
end