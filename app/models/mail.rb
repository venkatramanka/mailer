class Mail < ActiveRecord::Base
  attr_accessible :from, :message, :subject, :to, :user_id
  belongs_to :user
end
