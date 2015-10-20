class Research < ActiveRecord::Base
  belongs_to :job
  has_many :notes
end
