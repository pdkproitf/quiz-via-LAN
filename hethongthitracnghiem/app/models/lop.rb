class Lop < ActiveRecord::Base
  belongs_to :khoa
  has_many :user
end
