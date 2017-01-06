class CitiesController < ApplicationController
  include UsersHelper
  before_action :authorize_to_view_and_post, :reset_flash

def show
  @cities = City.all
  @city = City.find_by_id(params[:id])
  @posts = @city.posts.order("created_at desc")
end

end
