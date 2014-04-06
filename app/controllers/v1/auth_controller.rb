module V1
  class AuthController < ApiController
    def signup
      user = User.new new_user_params

      if user.save
        render json: {}, status: :created
      else
        render json: { errors: user.errors }, status: :unprocessable_entity
      end
    end

    def signin
      user = User.find_by(email: params[:email]).try :authenticate, params[:password]

      if user
        render json: user, serializer: AuthSerializer
      else
        render json: {}, status: :unauthorized
      end
    end

    private

    def new_user_params
      params.permit :email, :password
    end
  end
end
