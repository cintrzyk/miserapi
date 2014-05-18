class Survey
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :name, type: String

  validates :name, :user, presence: true
end
