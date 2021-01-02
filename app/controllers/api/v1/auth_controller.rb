class Api::V1::AuthController < ApplicationController
  # works with postman including if a user is created via postman. Checks the username exists and then if user exists and user can authenticate password to match will pass JWT token
  def login
    user = User.find_by(username: user_login_params[:username])
    if user && user.authenticate(user_login_params[:password])
      token = encode_token({ id: user.id })
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
