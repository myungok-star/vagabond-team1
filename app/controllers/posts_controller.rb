class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    user = current_user
    post = user.posts.create({title: post_params[:title], content: post_params[:content], city_id: params[:id]})

    redirect_to post_path(user_id: current_user.id, id: post.id)
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
