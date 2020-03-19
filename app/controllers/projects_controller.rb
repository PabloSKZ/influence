class ProjectsController < ApplicationController
  def index
    if current_user == nil
      flash[:notice] = "Veuillez vous connecter afin d'accéder à la liste des projets."
      redirect_to new_user_session_path
     end
    @projects = Project.all
  end

  def show
     if current_user == nil
      flash[:notice] = "Veuillez vous connecter afin d'accéder à la liste des projets."
      redirect_to new_user_session_path
     end
    @project = Project.find(params[:id])
    session[:id] = @project.id
  end

  def new
    @project = Project.new
    puts params
    puts "OH ZEBI FONCTIONNE LA NON"
  end

  def create
    puts "$"*100
    @project = Project.new(title: params[:title], description: params[:description], picture: 'https://images.pexels.com/photos/933964/pexels-photo-933964.jpeg?cs=srgb&dl=adolescent-adulte-amusement-assiette-933964.jpg&fm=jpg', user_id: current_user.id, link_field: params[:link_field])
      if @project.save
        flash[:notice] = "Votre projet a bien été créé."
        redirect_to root_path
      else
        @errors = @project.errors
        render new_project_path
      end
  end

  def update
    @project = Project.find(params[:id])
  if @project.update(title: params[:title], description: params[:description], link_field: params[:link_field])
    redirect_to @project
  else
    flash[:notice] = "Votre projet a bien été modifié."
    render :edit
  end
  end
end
