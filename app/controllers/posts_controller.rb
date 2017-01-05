class PostsController < ApplicationController
  include UsersHelper
  before_action :authorize_to_view_and_post
  def new
    @post = Post.new
  end

  def create
    user = current_user
    post = user.posts.new({title: post_params[:title], content: post_params[:content], city_id: params[:id]})
    if post.save
      redirect_to post_path(user_id: current_user.id, id: post.id)
    else
      flash[:error] = post.errors.full_messages[0]
      redirect_to new_post_path
    end

  end

  def update_post
    post = Post.find_by_id(params[:id])
    post.update_attributes(post_params)
    redirect_to user_path
  end

  def destroy
    post = Post.find_by_id(params[:id])
    post.destroy
    redirect_to user_path(id: post.user_id)
  end


  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
