class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_one :research
  has_one :job_application
  has_one :network
  has_one :interview
  has_one :document

  accepts_nested_attributes_for :research
  accepts_nested_attributes_for :document
  accepts_nested_attributes_for :job_application
  accepts_nested_attributes_for :network
  accepts_nested_attributes_for :interview
  accepts_nested_attributes_for :contacts
end
