# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :read, :update, :destroy, to: :rud
    
    if user
      if user.user_type == 'influencer'
        can :create, Project
        can :rud, Project, user_id: user.id
        can :read, Advert
      elsif user.user_type == 'freelance'
        can :create, Advert
        can :rud, Advert, user_id: user.id
        can :read, Project
      end
    else
    end
  end
  
end
