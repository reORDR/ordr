class Interview < ActiveRecord::Base
  belongs_to :job
  has_many :notes, as: :notable
end
