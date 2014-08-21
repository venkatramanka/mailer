class CreateLoginusers < ActiveRecord::Migration
  def change
    create_table :loginusers do |t|
      t.string :emailId
      t.string :password
      t.integer :user_id

      t.timestamps
    end
  end
end
