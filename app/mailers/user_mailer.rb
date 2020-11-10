class UserMailer < ApplicationMailer
  def salary(receiver_id, info)
    email = info[0]
    @info = info.drop(0)
    ReceiverInfo.find_by(id: receiver_id)&.update(status: true)
    mail(to: email, subject: "Lương #{1.month.ago.strftime("T%m/%Y")}")
  end
end
