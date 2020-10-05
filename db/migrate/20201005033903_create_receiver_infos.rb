class CreateReceiverInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :receiver_infos do |t|
      t.string :email
      t.string :name
      t.string :department_name
      t.string :salary
      t.string :target_month
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
