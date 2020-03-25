class UserMailer < ApplicationMailer
  default from: 'no-reply@influence-thp.herokuapp.com'
  
  def welcome_email(user)
    @user = user
    @url  = 'http://influence-thp.herokuapp.com/users/sign_in' 
    mail(to: @user.email, subject: 'Bienvenue sur Influence !')
  end

  def invitation_email(advert,project)
    @advert = advert
    @project = project
    @user = advert.user

    @url = "http://influence-thp.herokuapp.com//projects/#{@project.id}"

    mail(to: @user.email, subject: 'Vous avez rejoint un projet !')
  end

  def join_email(project,advert)
    @project = project
    @advert = advert
    @user = project.user

    @url = "http://influence-thp.herokuapp.com/projects/#{@project.id}"

    mail(to: @user.email, subject: 'Un freelance a rejoint votre projet !')
  end

end
