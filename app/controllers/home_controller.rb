class HomeController < ApplicationController
  def home
    @users = User.all.page(params[:page])
    @projects = Project.all.page(params[:page]).per(5)
  end

  def index
    if logged_in?
      @project = current_user.projects.build
      @feed_items = current_user.feed.all
    end
  end

  def about 
  end


end
