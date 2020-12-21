class ApplicationController < ActionController::Base
    include SessionsHelper
    
    #ログインしていないユーザーはlogin_pathに飛ばす
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ケツイが足りない！"
        redirect_to login_path
      end
    end
    
    
end
