class CreateForgotusers < ActiveRecord::Migration
  def change
    create_table :forgotusers do |t|
      t.string :securityQuestion
      t.string :securityAnswer
      t.string :newPassword

      t.timestamps
    end
  end
end
