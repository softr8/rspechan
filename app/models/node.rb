class Node < ActiveRecord::Base

  validates_presence_of :ip
  validates_uniqueness_of :ip

  state_machine :status, initial: :available do

  end

  class << self
    def availables
      Node.select(:ip).where('status = ?', 'available').map(&:ip)
    end
  end
end
