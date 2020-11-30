class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def destroy
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録に成功しました！"
      redirect_to home_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  def update
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end  
end
