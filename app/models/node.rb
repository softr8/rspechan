class Node < ActiveRecord::Base

  validates_presence_of :ip
  validates_uniqueness_of :ip

  after_create :enqueue_provisioning

  state_machine :status, initial: :enqueued do
    event :provisioned do
      transition enqueued: :provisioned
    end

    event :failed do
      transition enqueued: :failed
    end
  end

  class << self
    def availables
      Node.select(:ip).where('status = ?', 'provisioned').map(&:ip)
    end
  end

  private
  def enqueue_provisioning
    Resque.enqueue Async::Provision, ip
  end
end
