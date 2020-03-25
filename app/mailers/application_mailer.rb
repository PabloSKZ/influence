class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@influence-thp.herokuapp.com'
  layout 'mailer'
end
