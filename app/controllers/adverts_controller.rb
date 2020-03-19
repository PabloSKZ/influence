class AdvertsController < ApplicationController

  def index
    @adverts = Advert.all
  end

  def new
    
  end

  def create
  
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def edit
  
  end
end
