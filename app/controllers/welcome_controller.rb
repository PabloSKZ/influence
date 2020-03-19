class WelcomeController < ApplicationController
  def index
    @projects = Project.all
    @adverts = Advert.all
  end
end
