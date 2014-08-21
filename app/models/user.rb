class User < ActiveRecord::Base
  attr_accessible :dob, :emailId, :name, :password, :securityAnswer, :securityQuestion
  has_many :mails
  belongs_to :loginuser
  validates_presence_of :dob, :emailId, :name, :password, :securityAnswer, :securityQuestion
  validates_format_of :emailId, with: /[a-z*0-9*]@mailer.com/i
  validates_uniqueness_of :emailId
end
