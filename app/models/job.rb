class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_one :research

  accepts_nested_attributes_for :research
end
