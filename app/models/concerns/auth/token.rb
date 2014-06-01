module Concerns
  module Auth::Token
    extend ActiveSupport::Concern

    included do
      before_create :set_auth_token

      field :auth_token,  type: String
      validates :auth_token, uniqueness: true
    end

    private

    def set_auth_token
      return if auth_token.present?
      self.auth_token = generate_token
    end

    def generate_token
      loop do
        token = SecureRandom.hex
        break token unless self.class.where(auth_token: token).exists?
      end
    end
  end
end
