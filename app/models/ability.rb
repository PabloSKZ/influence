# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :read, :update, :destroy, to: :rud
    alias_action :update, :destroy, to: :ud
    
    if user
      if user.user_type == 'influencer'
        can :create, Project
        can :read, Project
        can :ud, Project, user_id: user.id
        can :read, Advert
      elsif user.user_type == 'freelance'
        can :create, Advert
        can :read, Advert
        can :ud, Advert, user_id: user.id
        can :read, Project
      end
    else
      can :read, Advert
    end
  end

end
