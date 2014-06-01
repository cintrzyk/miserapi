module V1
  class ConfirmationsController < APIController
    def create
    end

    def new
      render json: {}, status: 404
    end

    def show
      user = User.confirm_by_token params[:confirmation_token]

      if user.errors.empty?
        render json: user, serializer: AuthSerializer, status: 201
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  end
end
