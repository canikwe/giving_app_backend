class UsersController < ApplicationController
  before_action :get_user, only: :show

  def index
    users = User.all
    render json: users.to_json(except: [:created_at, :updated_at])
  end

  def show
    render json: @user.to_json(except: [:created_at, :updated_at])
  end

  private

  def get_user
    @user = User.find(params[:id])
  end
end
