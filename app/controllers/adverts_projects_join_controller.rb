class AdvertsProjectsJoinController < ApplicationController
    def create
        puts "$"*100
        @project = Project.find(params[:id])
        @ad_pro_join = AdvertsProjectsJoin.create(project_id: @project.id, advert_id: )
    end
end
