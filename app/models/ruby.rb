class Ruby < ActiveRecord::Base
  has_many :projects

  state_machine :status, initial: :active do
    event :deactivate do
      transition active: :deactivated
    end

    event :reactivate do
      transition deactiviated: :active
    end

  end

  class << self
    def availables
      Ruby.where(['status = ?', 'active'])
    end
  end
end
