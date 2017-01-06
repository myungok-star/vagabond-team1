module UsersHelper
  def authorize
    user = User.find_by_id(params[:user_id]||params[:id])
    if !current_user
      flash_message
    elsif current_user != user
      flash[:error] = "Sorry, but you can't look other people personal pages"
      redirect_to user_path(current_user)
    end
  end

  def authorize_to_view_and_post
    if !current_user
      flash_message
    end
  end

  def if_logged_in
    if current_user
      redirect_to user_path(current_user)
    end
  end

  private
  def flash_message
    flash[:error] = "You have to log in first!"
    redirect_to "/login"
  end

end
