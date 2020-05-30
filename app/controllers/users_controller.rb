class UsersController < ApplicationController
  before_action :get_user, only: :show

  def index
    users = User.all
    render json: users.to_json(user_serializer), status: :ok
  end

  def show
    render json: @user.to_json(user_serializer), status: :ok
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render json: user.to_json(user_serializer), status: :created
    else
      render json: {message: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def login
    user = User.find_by(user_params)
    if !user.nil?
      render json: user.to_json(user_serializer), status: :accepted
    else
      render json: {message: 'Error occurred logging in. Please try again.'}, status: :not_acceptable
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
