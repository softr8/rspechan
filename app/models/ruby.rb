class Ruby < ActiveRecord::Base
  has_many :projects

  class << self
    def availables
      Ruby.where(['status = ?', 'active'])
    end
  end
end
