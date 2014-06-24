class Writing
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps

  field :resume, type: Mongoid::Boolean
  field :cover_letter, type: Mongoid::Boolean
  field :notes

  belongs_to :job
end
