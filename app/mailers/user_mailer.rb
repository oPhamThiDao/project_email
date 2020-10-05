class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(receiver_id, info)
    email = info[0]
    @info = info.drop(0)
    receiver = ReceiverInfo.find_by(id: receiver_id)
    receiver.update(status: true) if receiver
    mail(to: email, subject: "Lương #{1.month.ago.strftime("T%m/%Y")}")
  end
end
