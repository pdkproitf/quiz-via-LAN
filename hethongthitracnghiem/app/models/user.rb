class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :lops
  belongs_to :roles
  has_many :diems

  def self.list(page)
    User.paginate(:page => page, :per_page => 5)
  end

  def self.edit(id)
    User.find_by_id(id)   
  end

  def self.xu_ly_edit(id,name,email,role_id)
    if User.find_by_id(id)
      User.find_by_id(id).update(id: id,name: name, email: email,role_id: role_id)
    end
  end

  def isadmin?
        if self.id.nil?
           false
        else
          self.role_id ==1   
        end 
  end

  def isuser?
    if self.id.nil?
        false
    else
            self.role_id ==2
    end 
  end
  
end
