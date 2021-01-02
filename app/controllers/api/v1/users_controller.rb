class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, serializer: UserSerializer, status: :created
    else
      render json: { error: "failed to create user" }, status: :not_acceptable
    end
  end

  def update
    user = logged_in_user
    user.update(user_params)
    render json: user, serializer: UserSerializer, status: :OK
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :favourite_mums_dish, :age)
  end
end
