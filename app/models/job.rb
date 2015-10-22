class Job < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, dependent: :destroy
  has_one :research, dependent: :destroy
  has_one :job_application, dependent: :destroy
  has_one :network, dependent: :destroy
  has_one :interview, dependent: :destroy
  has_one :document, dependent: :destroy
  has_many :notes

  accepts_nested_attributes_for :research
  accepts_nested_attributes_for :document
  accepts_nested_attributes_for :job_application
  accepts_nested_attributes_for :network
  accepts_nested_attributes_for :interview
  accepts_nested_attributes_for :contacts
end
