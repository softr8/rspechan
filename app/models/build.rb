class Build < ActiveRecord::Base
  belongs_to :project
  has_many :specs

  delegate :name, to: :project, prefix: :project

  state_machine :state, initial: :enqueued do
    after_transition on: :enqueued, do: :enqueue_build
  end


  private
  def enqueue_build
  end
end
