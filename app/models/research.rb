class Research < ActiveRecord::Base
  has_many :notes, as: :notable
end
