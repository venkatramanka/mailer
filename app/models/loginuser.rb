class Loginuser < ActiveRecord::Base
  attr_accessible :emailId, :password, :user_id
  has_one :user
end
