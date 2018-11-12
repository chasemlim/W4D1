class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      redirect_to action: "index"
    end
  end

  def update
    user = User.find_by(id: params[:id])

    if user
      user.update(user_params)
    else
      render plain: "There was an error updating user with id #{params[:id]}"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])

    if user
      user.destroy
    else
      render plain: "There was an error destroying user with id #{params[:id]}"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
