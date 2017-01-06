class SessionsController < ApplicationController
  include UsersHelper
  before_action :if_logged_in, except: [:destroy]
  def index
  end

  def new
  end

  def create
  # TODO: use flash messaging to let the user know if they entered the wrong username/password
  user = User.find_by_email(params[:email])
  # If the user exists AND the password entered is correct.
  if user && user.authenticate(params[:password])
    # Save the user id inside the browser cookie. This is how we keep the user
    # logged in when they navigate around our website.
    session[:user_id] = user.id
    redirect_to user_path(user)
  else

  # use flash messaging to let the user know if they entered the wrong username/password
  flash[:error] = "Wrong email or password!"
   redirect_to '/login'
   # If user's login doesn't work, send them back to the login form.

  end
end

def destroy
  current_user = session[:user_id] = nil
  redirect_to '/login'
end

end
