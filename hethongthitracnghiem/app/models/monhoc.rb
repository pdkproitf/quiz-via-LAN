class Monhoc < ActiveRecord::Base
  has_many :diems
  has_many :users
end
