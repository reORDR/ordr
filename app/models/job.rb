class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts
  has_many :notes, as: :notable
  has_one :job_application
  has_one :network
  has_many :interviews
  has_one :document

  # validates :document, presence: true

  accepts_nested_attributes_for :document
  accepts_nested_attributes_for :job_application
  accepts_nested_attributes_for :network
  accepts_nested_attributes_for :interviews
  accepts_nested_attributes_for :contacts
end
