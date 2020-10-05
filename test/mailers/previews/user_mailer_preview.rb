# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    receiver_id = 2
    info = ["example@example.com", 11, "Phạm Thị Đào", "CS1", "Sale ONL", 29, 28, 8000, nil, nil, nil, nil, nil, nil, 8285.71]
    UserMailer.welcome_email(receiver_id, info)
  end
end
