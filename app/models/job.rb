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

  has_many :research_notes, through: :research, source: :notes
  has_many :network_notes, through: :network, source: :notes
  has_many :interview_notes, through: :interview, source: :notes
  has_many :job_application_notes, through: :job_application, source: :notes
  has_many :document_notes, through: :document, source: :notes

  # step => path
  STEPS = {
    'research' => 'researches',
    'network' => 'networks',
    'document' => 'documents',
    'job_application' => 'job_applications',
    'interview' => 'interviews'
  }

  def notes(step)
    self.send("#{step}_notes")
  end


end
