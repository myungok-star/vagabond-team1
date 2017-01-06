class CommentsController < ApplicationController
  def create
    post = Post.find_by_id(params[:id])
    city = City.find_by_id(post.city_id)
    post.comments.create(content: comment_params[:content], user_profile_image: current_user.image)
    redirect_to city_path(city)
  end

  private
  def comment_params
    params.require(:comment).permit(:content);
  end
end
