class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_one :job_application
  has_many :networks
  has_many :interviews
  has_one :document

  validates :document, presence: true

  accepts_nested_attributes_for :document
end
