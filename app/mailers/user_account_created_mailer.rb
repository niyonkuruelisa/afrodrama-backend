class UserAccountCreatedMailer < ApplicationMailer
  default from: 'afrodramateam@gmail.com'

  def welcome_email
    @user = params[:user]
    @system = params[:system]
    @url  = 'https://afrodrama.com'
    mail(to: @user.email, subject: 'Welcome to AfroDrama')
  end
end
