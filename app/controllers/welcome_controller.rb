class WelcomeController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc)
    @adverts = Advert.order(created_at: :desc)
  end
end
