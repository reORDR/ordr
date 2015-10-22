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

  has_many :research_notes, through: :research, source: :notes
  has_many :network_notes, through: :network, source: :notes
  has_many :contacts_notes, through: :contacts, source: :notes
  has_many :interview_notes, through: :interview, source: :notes
  has_many :job_application_notes, through: :job_application, source: :notes
  has_many :document_notes, through: :document, source: :notes

  STEPS = [
    'research',
    'network',
    'contacts',
    'document',
    'job_application',
    'interview'
  ]

  def notes(step)
    self.send("#{step}_notes")
  end
end
