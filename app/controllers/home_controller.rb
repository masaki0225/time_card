class HomeController < ApplicationController
  def home
    @users = User.all
    @projects = Project.all
  end
  
  def index
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed.all
    end 
  end 
  
  
end
