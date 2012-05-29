class Build < ActiveRecord::Base
  belongs_to :project
  has_many :specs

  delegate :name, to: :project, prefix: :project

  after_create :enqueue_build

  state_machine :state, initial: :enqueued do
    event :deployed do
      transition enqueued: :deployed
    end

    event :failed do
      transition all: :failed
    end
  end

  private
  def enqueue_build
    Resque.enqueue Async::Deploy, {project_id: project.id, build_id: self.id, organization_id: OrganizationHelper.default_id }
  end
end
