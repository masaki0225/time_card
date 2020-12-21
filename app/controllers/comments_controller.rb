class CommentsController < ApplicationController

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:success] = "投稿成功"
      redirect_to controller: :projects, action: :show, id: @comment.project.id
    else
      flash[:danger] = "sippai!"
      redirect_to root_path
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
   redirect_to controller: :projects, action: :show, id: @comment.project.id
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,
                                                 project_id: params[:project_id])
  end
end
