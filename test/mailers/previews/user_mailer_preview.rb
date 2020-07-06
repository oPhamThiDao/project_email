# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = ENV["GMAIL_USERNAME"]
    email = "example01@example.com"
    UserMailer.welcome_email(user, email)
  end
end
