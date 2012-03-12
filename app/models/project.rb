class Project < ActiveRecord::Base
  has_many :builds

  class << self
    def latest_built
      Project.order('updated_at desc')
    end
  end

  def last_build
    builds.last
  end
end
