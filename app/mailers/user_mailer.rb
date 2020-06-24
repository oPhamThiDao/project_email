class UserMailer < ApplicationMailer
  default from: "daopt1995@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "https://www.youtube.com/watch?v=fz8Ya9IS5eY&list=RD_x31sDLWQuU&index=5"
    mail(to: "daopt22@gmail.com", subject: "Title: test send mail")
  end
end
