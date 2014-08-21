class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :emailId
      t.string :password
      t.date :dob
      t.string :securityQuestion
      t.string :securityAnswer

      t.timestamps
    end
  end
end
