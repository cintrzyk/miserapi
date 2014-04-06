module Concerns
  module Auth::Confirmable
    extend ActiveSupport::Concern

    included do
      devise :confirmable

      field :confirmation_token,   type: String
      field :confirmed_at,         type: Time
      field :confirmation_sent_at, type: Time
    end
  end
end
