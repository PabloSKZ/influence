class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    session[:id] = @project.id
  end

  def new
    puts params
    puts "OH ZEBI FONCTIONNE LA NON"
  end

  def create
    @project = Project.new(title: params[:title], content: params[:description])
      if @project.save
        flash[:notice] = "Votre projet a bien été créé."
        redirect_to root_path
      else
        @errors = @project.errors
        render new_project_path
      end
  end

  def edit
  end

  def update
  end
end
