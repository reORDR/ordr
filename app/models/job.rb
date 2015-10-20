class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_many :researches
end
