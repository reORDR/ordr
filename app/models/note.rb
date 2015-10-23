class Note < ActiveRecord::Base
  belongs_to :notable, polymorphic: true

  validates :body, presence: true

  def notable_note_path
    notable = Job::STEPS["#{ self.notable_type.underscore }"]
    "/#{notable}/#{self.notable_id}/notes/#{self.id}"
  end

  def edit_notable_note_path
    notable_note_path + "/edit"
  end
end
