class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
