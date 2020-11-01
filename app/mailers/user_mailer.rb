class UserMailer < ApplicationMailer
  def welcome_email
    @customer = params[:user]

    @email = ENV['FROM']
    @url   = ENV['HOSTNAME']
    mail(to: @customer.email, subject: 'Bienvenue sur notre site !')
  end
end
