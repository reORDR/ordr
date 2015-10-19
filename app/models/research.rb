class Research < ActiveRecord::Base
  belongs_to :job
  
  field :company_mission, type: String
  field :company_goals, type: String
  field :current_projects, type: String
  field :done, type: Mongoid::Boolean

  # Functionality below seems unnecessary
  # has_many :notes
  # has_many :contacts
end
