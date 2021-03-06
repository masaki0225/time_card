class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit,:update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    flash[:success] = "削除ぉ！"
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録に成功しました！"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @q = @user.projects.ransack(params[:q])#検索オブジェクト
    @projects = @q.result.page(params[:page]).per(5)#検索結果or前件表示
    @serch = @user.participation_projects.ransack(params[:q])
    @participation_projects = @serch.result.page(params[:page]).per(5)
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:success] = "Edit Determination!"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #他のユーザーが編集できないようにする
    def correct_user
      @user = User.find_by(id: params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
