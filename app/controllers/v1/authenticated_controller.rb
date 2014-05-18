module V1
  class AuthenticatedController < ApiController
    before_action :authenticate

    decent_configuration do
      strategy DecentExposure::StrongParametersStrategy
    end
  end
end
