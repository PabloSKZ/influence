class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    # if current_user == nil
      # redirect_to root_path
    # end
    @project = Project.find(params[:id])
    session[:id] = @project.id
  end

  def new
    @project = Project.new
    puts params
    puts "OH ZEBI FONCTIONNE LA NON"
  end

  def create
    @project = Project.new(title: params[:title], description: params[:description], img_url: '#')
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
    @project = Project.find(params[:id])
  if @project.update(title: params[:title], description: params[:description])
    redirect_to @project
  else
    render :edit
  end
  end
end
