module V1
  class AuthenticatedController < APIController
    before_action :authenticate

    decent_configuration do
      strategy DecentExposure::StrongParametersStrategy
    end
  end
end
