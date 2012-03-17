require 'singleton'
class OrganizationHelper
  include Singleton
  attr_internal :default_id

  class << self
    def default_id= id
      self.instance.default_id = id
    end

    def default_id
      self.instance.default_id
    end
  end
end