class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, except: :create

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name
    )
  end
end