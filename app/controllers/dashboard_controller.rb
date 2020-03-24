class DashboardController < ApplicationController
 
  def show
    authorize! :read, Project
  end
end
