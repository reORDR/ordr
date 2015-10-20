class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_one :job_application
  has_many :networks
  has_many :interviews
  has_one :documents
end
