class AdvertsProjectsJoin < ApplicationRecord
  after_create :join_send
  after_create :invitation_send

  belongs_to :advert
  belongs_to :project


  def join_send
    UserMailer.join_email(self.project,self.advert).deliver_now
  end

  def invitation_send
    UserMailer.invitation_email(self.advert,self.project).deliver_now
  end
  
end
