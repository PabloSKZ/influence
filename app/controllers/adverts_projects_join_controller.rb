class AdvertsProjectsJoinController < ApplicationController
    def create
        @ad_pro_join = AdvertsProjectsJoin.create(project_id: params[:format], advert_id: params[:project_id],status:"pending")
        redirect_to root_path
    end

    def destroy
        @adverts_projects_join = AdvertsProjectsJoin.where(project_id: params[:project_id], advert_id: params[:id])[0]
        @adverts_projects_join.destroy
        redirect_to root_path
    end
end
