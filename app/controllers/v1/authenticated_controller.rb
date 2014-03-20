module V1
  class AuthenticatedController < ApiController
    before_action :authenticate
  end
end
