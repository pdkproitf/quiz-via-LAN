class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new

    if user.isadmin?
        can :manage , :all
        can :show,:all
    elsif user.isuser? 
        can :manage , :all
        cannot :edit ,User, :user_id => user.id
        can :show,:all
        can :load_de,:all
    else
        can :read, :all
        cannot :edit, :all
        cannot :show, :all
    end
  end
end
