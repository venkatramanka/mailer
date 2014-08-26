class Forgotuser < ActiveRecord::Base
  attr_accessible :newPassword, :securityAnswer, :securityQuestion
  has_one :user
end
