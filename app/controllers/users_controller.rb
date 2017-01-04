class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/signup'
    end
  end

  def show
    @user = current_user
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find_by_id(params[:id])
    # name_param = params.require(:user).permit(:name)
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_city, :image)
  end



end
