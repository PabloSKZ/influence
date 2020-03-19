class AdvertsProjectsJoinController < ApplicationController
    def create
        puts params
        @ad_pro_join = AdvertsProjectsJoin.create(project_id: params[:project_id], advert_id: params[:format])
        redirect_to root_path
    end
end
