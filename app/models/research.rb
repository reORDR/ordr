class Research < ActiveRecord::Base
  has_many :notes, as: :notable
  belongs_to :job
end
