class AdvertsProjectsJoinController < ApplicationController
    def create
        puts params
        @ad_pro_join = AdvertsProjectsJoin.create(project_id: params[:format], advert_id: params[:project_id])
        redirect_to root_path
    end

    def destroy
        puts "$" *60
        @adverts_projects_join = AdvertsProjectsJoin.where(project_id: params[:project_id], advert_id: params[:id])[0]
        @adverts_projects_join.destroy
        redirect_to root_path
    end
end
