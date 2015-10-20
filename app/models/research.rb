class Research < ActiveRecord::Base
  belongs_to :job
  
  has_many :notes
  has_many :contacts
end
