class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(info)
    email = info[0]
    @info = info.drop(0)
    mail(to: email, subject: "Lương #{1.month.ago.strftime("T%m/%Y")}")
  end
end
