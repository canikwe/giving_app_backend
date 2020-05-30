class UsersController < ApplicationController
  before_action :get_user, only: :show

  def index
    users = User.all
    render json: users.to_json(user_serializer)
  end

  def show
    render json: @user.to_json(user_serializer)
  end

  def login
    user = User.find_by(user_params)
    if !user.nil?
      render json: user.to_json(user_serializer)
    else
      render json: {message: 'Please try again'}
    end
  
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  def user_serializer
    {except: [:created_at, :updated_at]}
  end
end
