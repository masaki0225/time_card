class HomeController < ApplicationController
  def home
    @users = User.all
  end
  
  def index
  end 
  
  
end
