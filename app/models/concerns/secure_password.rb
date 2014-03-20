module Concerns::SecurePassword
  extend ActiveSupport::Concern
  include ActiveModel::SecurePassword

  included do
    has_secure_password
    field :password_digest, type: String
  end
end
