class AvatarsController < ApplicationController
  def create
    @advert = Advert.find(params[:advert_id])
    @advert.avatar.attach(params[:avatar])
    redirect_to(advert_path(@advert))
  end
end
