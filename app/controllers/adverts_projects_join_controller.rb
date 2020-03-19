class AdvertsProjectsJoinController < ApplicationController
    def create
        puts params
        @ad_pro_join = AdvertsProjectsJoin.create(project_id: params[:format], advert_id: params[:project_id])
        redirect_to root_path
    end
end
