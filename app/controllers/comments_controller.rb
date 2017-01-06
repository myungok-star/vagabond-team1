class CommentsController < ApplicationController
  def create
    post = Post.find_by_id(params[:id])
    city = City.find_by_id(post.city_id)
    post.comments.create(content: comment_params[:content], user_profile_image: current_user.image, user_id: current_user.id)
    redirect_to city_path(city)
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    post =  Post.find_by_id(comment.post_id)
    city = City.find_by_id(post.city_id)
    comment.destroy
    redirect_to city_path(city)
  end
  private
  def comment_params
    params.require(:comment).permit(:content);
  end
end
