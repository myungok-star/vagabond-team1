class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    # alert
    user = current_user
    # city = City.find(params[:id])
    post = user.posts.create({title: post_params[:title], content: post_params[:content], city_id: params[:id]})
    # post = city.posts.create(post_params

    redirect_to post_path(user_id: current_user.id, id: post.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
