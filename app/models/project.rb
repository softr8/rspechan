class Project < ActiveRecord::Base
  has_many :builds
  belongs_to :organization

  validates_presence_of :repo
  validates_uniqueness_of :repo

  default_scope { where(['organization_id = ?', OrganizationHelper.default_id]) }

  class << self
    def latest_built
      Project.order('updated_at desc')
    end
  end

  def last_build
    builds.last
  end

  def last_builds
    builds.order('created_at desc')
  end
end
