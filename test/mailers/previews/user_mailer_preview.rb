# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def salary
    receiver_id = 2
    info = ["daopt22@gmail.com", 11, "Phạm Thị Đào", "CS1", "Sale ONL", 29, 28, 8000, nil, nil, 1888, nil, nil, nil, nil, 8285.71]
    UserMailer.salary(receiver_id, info).deliver_now
  end
end
