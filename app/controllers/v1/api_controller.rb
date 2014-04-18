module V1
  class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token

    protected

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        User.find_by auth_token: token
      end
    end

    def render_unauthorized
      self.headers['Authorization'] = %(Token miser="token")
      render json: 'Bad credentials', status: 401
    end
  end
end
