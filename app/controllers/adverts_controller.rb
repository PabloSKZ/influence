class AdvertsController < ApplicationController

  def index
    @adverts = Advert.all
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(advert_params)

    if @advert.save
      flash[:notice] = "Votre annonce a bien été créé."
      redirect_to root_path
    else
      @errors = @advert.errors
      render new_advert_path
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
    puts params
    if @advert.update(title: params[:advert][:title],tag: params[:advert][:tag],description: params[:advert][:description],price: params[:advert][:price],link_field: params[:advert][:link_field],)
      flash[:notice] = "Votre projet a bien été modifié."
      redirect_to @advert
    else
      render :edit
    end

  end


  private

  def advert_params
    params.permit(:title, :description, :link_field, :price, :tag, :user_id)
  end

end
