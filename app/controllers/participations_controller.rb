class ParticipationsController < ApplicationController

  def create
    @project = Project.find_by(id: params[:project_id])
    @participation = Participation.create(user_id: current_user.id,
                                          project_id: @project.id)
    if @participation.save
      flash[:success] = "参加しました"
      redirect_to controller: :projects, action: :show, id: @participation.project_id
    else
      flash[:danger] = "sippai!"
      redirect_to root_url
    end

  end

  def destroy
    @participation = Participation.find_by(project_id: params[:project_id],
                                           user_id: params[:id])
    @participation.destroy
    flash[:success] = "不参加"
    redirect_to user_path(current_user)
  end

end
