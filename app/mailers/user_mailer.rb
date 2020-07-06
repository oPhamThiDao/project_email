class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user, email)
    headers['X-No-Spam'] = 'True'
    @user = user
    mail(to: email, subject: "Lương T6/2020")
  end
end
