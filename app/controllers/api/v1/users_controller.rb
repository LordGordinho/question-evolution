class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def show
    user = User.find_by(id: params[:id])

    render json: { user: user, image: Rails.root.to_s + user.avatar.url }, code: 200
  end

  def create
    user = User.new(user_params)

    if user.save 
      render json: { user: user }, code: 201
    else
      render json: { errors: user.errors.full_messages }, code: 403
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      render json: { user: user }, code: 200
    else
      render json: { errors: user.errors}, code: 403
    end

  end

  private 
  
  def user_params
    params.permit(:email, :password, :name, :avatar, :role_id)
  end
end
