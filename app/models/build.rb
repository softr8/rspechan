class Build < ActiveRecord::Base
  belongs_to :project
  has_many :spec_tests

  delegate :name, to: :project, prefix: :project

  after_create :enqueue_build

  state_machine :state, initial: :enqueued do

    before_transition all => [:failed, :finished], do: :update_finished_at
    #before_transition [:failed, :finished], do: :update_finished_at

    event :deployed do
      transition from: :enqueued, to: :deployed
    end

    event :building do
      transition from: :deployed, to: :building
    end

    event :finished do
      transition from: [:building, :finished], to: :finished
    end

    event :failed do
      transition from: [:enqueued, :building, :deployed, :failed], to: :failed
    end

  end

  private
  def enqueue_build
    Resque.enqueue Async::Deploy, {project_id: project.id, build_id: self.id, organization_id: OrganizationHelper.default_id }
  end

  def update_finished_at
    self.finished_at = Time.zone.now
  end
end
