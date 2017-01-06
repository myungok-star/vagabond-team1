class UsersController < ApplicationController
  include UsersHelper
  before_action :authorize, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages[0]
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts.order("created_at desc")
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

    def edit_post
      @post = Post.find_by_id(params[:id])
    end

    def show_post
      @post = Post.find(params[:id])
      @user = @post.user
    end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_city, :image)
  end



end
