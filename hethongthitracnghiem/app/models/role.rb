class Role < ActiveRecord::Base
  has_many :users
  def self.edit_find(name)
    Role.find_by_name(name)
  end
end
