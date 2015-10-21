class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true

  validates :body, presence: true
end
