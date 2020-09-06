class ApplicationController < ActionController::API
  before_action :authorized

  def initialize
    @secret = ENV["ENV_VAR"]
  end

  def auth_header
    request.headers["Authorization"]
  end

  def encode_token(payload)
    JWT.encode(payload, @secret)
  end

  def decoded_token
    if auth_header
      token = auth_header
      begin
        return JWT.decode(token, @secret)[0]
      rescue JWT::DecodeError
        return nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token["user_id"]
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    if !!logged_in_user
      render json: { message: "Please log in" }, status: :unauthorized
    end
  end
end
