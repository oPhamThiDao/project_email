# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = "Dao Pham 222"

    UserMailer.with(user: user).welcome_email
  end
end