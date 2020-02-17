class UserMailer < ApplicationMailer
  default from: 'no-reply@side-events.fr'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://side-events.herokuapp.com/login' 
    mail(to: @user.email, subject: 'Welcome to Side Events!') 
  end
end
