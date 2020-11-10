class ReceiverInfo < ApplicationRecord
  scope :in_month_ago, ->(target_month = 1.month.ago.strftime("%Y%m")) { where(target_month: target_month).order(status: :asc, updated_at: :desc) }

  def self.create_record(target_month, arg)
    create(email: arg[0], name: arg[2], department_name: arg[4], salary: arg[15].to_s, target_month: target_month, status: false)
  end
end
