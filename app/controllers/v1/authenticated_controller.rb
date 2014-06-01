module V1
  class AuthenticatedController < APIController
    before_action :authenticate!
  end
end
