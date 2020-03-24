class AdvertsController < ApplicationController
  load_and_authorize_resource param_method: :my_sanitizer
  def index
    @adverts = Advert.order(created_at: :desc)
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(title: params[:advert][:title],tag: params[:advert][:tag],description: params[:advert][:description],price: params[:advert][:price],link_field: params[:advert][:link_field])
    @advert.user_id = current_user.id
    @advert.picture = "https://i.stack.imgur.com/l60Hf.png"
    @errors = @advert.errors
    if @advert.save
      flash[:success] = "Votre annonce a bien été créée."
      redirect_to advert_path(@advert)
    elsif @errors 
      if @errors[:tag] == ["has already been taken"]
        flash[:notice] = "Veuillez sélectionner un métier pour lequel vous n'avez pas déjà d'annonce."
        redirect_to new_advert_path
      else
        flash[:notice] = "Veuillez vérifier que tous les champs sont correctement remplis."
        redirect_to new_advert_path
      end
    end
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])
    if @advert.update(description: params[:advert][:description],price: params[:advert][:price],link_field: params[:advert][:link_field])
      if !params[:advert][:avatar].nil?
        @advert.avatar.attach(params[:advert][:avatar])
      end
      flash[:success] = "Votre projet a bien été modifié."
      redirect_to @advert
    else
      flash[:notice] = "Veuillez vérifier vos modifications."
      render :edit
    end
  end

  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
    flash[:alert] = "Votre projet a bien été supprimé."
    redirect_to root_path
  end

  def my_sanitizer
    
  end

  private

  def advert_params
    params.permit(:title, :description, :link_field, :price, :tag, :user_id)
  end

end
