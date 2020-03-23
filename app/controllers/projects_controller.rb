class ProjectsController < ApplicationController
  def index
    if current_user == nil
      flash[:notice] = "Veuillez vous connecter afin d'accéder à la liste des projets."
      redirect_to new_user_session_path
    elsif authorize! :read, @project
     end
    @projects = Project.order(created_at: :desc)
  end

  def show
    @project = Project.find(params[:id])
    authorize! :read, @project, :message => "Vous n'avez pas accès à ce projet."
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
        flash[:notice] = "Votre projet a bien été créé."
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
      redirect_to @project
    else
      flash[:notice] = "Votre projet a bien été modifié."
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Votre projet a bien été supprimé."
    redirect_to dashboard_path(params[:id])
  end
end
