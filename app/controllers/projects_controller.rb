class ProjectsController < ApplicationController
  load_and_authorize_resource param_method: :my_sanitizer
  def index
    @projects = Project.order(created_at: :desc)
    if current_user == nil
      flash[:notice] = "Veuillez vous connecter afin d'accéder à la liste des projets."
      redirect_to new_user_session_path
    end
  end

  def show
    @project = Project.find(params[:id])
     if current_user == nil
      flash[:notice] = "Veuillez vous connecter afin d'accéder à la liste des projets."
      redirect_to new_user_session_path
     end
    session[:id] = @project.id
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(title: params[:project][:title], description: params[:project][:description], link_field: params[:project][:link_field], picture: 'https://images.pexels.com/photos/933964/pexels-photo-933964.jpeg?cs=srgb&dl=adolescent-adulte-amusement-assiette-933964.jpg&fm=jpg', user_id: current_user.id)
      if @project.save
        flash[:success] = "Votre projet a bien été créé."
        redirect_to project_path(@project)
      else
        @errors = @project.errors
        render new_project_path
      end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    puts params
      @project = Project.find(params[:id])
    if @project.update(title: params[:project][:title], description: params[:project][:description], link_field: params[:project][:link_field])
      if !params[:project][:cover].nil?
        @project.cover.attach(params[:project][:cover])
      end
      flash[:success] = "Votre projet a bien été modifié."
      redirect_to @project
    else
      flash[:notice] = "Veuillez vérifier vos modifications."
      redirect_to edit_project_path(params[:id])
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "Votre projet a bien été supprimé."
    redirect_to dashboard_path(params[:id])
  end

  def my_sanitizer
    
  end
end
