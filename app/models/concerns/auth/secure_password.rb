module Concerns
  module Auth::SecurePassword
    extend ActiveSupport::Concern
    include ActiveModel::SecurePassword

    included do
      has_secure_password
      field :password_digest, type: String

      validates :password, length: { minimum: 6 }
    end
  end
end
