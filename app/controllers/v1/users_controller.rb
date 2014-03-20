module V1
  class UsersController < AuthenticatedController
    expose(:users) { User.all }
    expose(:user)

    def index
      render json: users
    end

    def show
      render json: user
    end
  end
end
