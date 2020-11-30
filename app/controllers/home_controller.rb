class HomeController < ApplicationController
  def home
    @users = User.all
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def index
  end 
  
  
end
