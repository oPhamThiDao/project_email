class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user)
    @user = user
    mail(to: "daopt22@gmail.com", subject: "Lương T5/2020")
  end
end
