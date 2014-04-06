class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Concerns::Auth::Token
  include Concerns::Auth::SecurePassword
  include Concerns::Auth::Confirmable

  field :name,      type: String
  field :email,     type: String

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
