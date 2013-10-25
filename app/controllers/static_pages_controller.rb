class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  	 @team  = current_user.teams.build
     @feed_items = current_user.feed.paginate(page: params[:page], per_page: 3)
 	end
  end
  def help
  end
  def about
  end
end
