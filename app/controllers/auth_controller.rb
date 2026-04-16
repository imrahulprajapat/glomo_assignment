class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email], pin: params[:pin])

    if user
      render json: { user_id: user.id }
    else
      render json: { error: "Invalid email or PIN" }, status: :unauthorized
    end
  end
end