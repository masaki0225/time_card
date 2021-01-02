class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user, only: [:destroy]

    def new
        @project = current_user.projects.build
    end

    def show
        @project = Project.find_by(id: params[:id])
        @participation = @project.participations.build
        @participation_users = @project.participation_users
        @comment = @project.comments.build
        @comments = @project.comments.all
        if logged_in?
          @sanka = Participation.find_by(user_id: current_user.id,
                                         project_id: @project.id)
        end
    end

    def create
        @project = current_user.projects.build(project_params)
        @project.image.attach(params[:project][:image])
        if @project.end_on && @project.start_on
          sabun = (@project.end_on - @project.start_on).to_i
          if sabun > 0
            if @project.save
                flash[:success] = "ケツイを力に変えるんだ！"
                redirect_to root_url
            else
                render "new"
            end
          else
            flash[:error] = "日程が正しくありません"
            render "new"
          end
        else
          flash[:error] = "日程を選択しなよ"
          render 'new'
        end
    end

    def destroy
        if @project.destroy
          flash[:success] = "プロジェクトを削除しました"
          redirect_to root_url
        else
          render "current_user_path"
        end
    end

    def edit
      @project = Project.find_by(id: params[:id])
    end

    def update
      @project = Project.find_by(id: params[:id])
      if @project.update(update_params)
        flash[:success] = "update!"
        redirect_to root_url
      else
        render "edit"
      end
    end

    private

      def project_params
        params.require(:project).permit(:title, :content, :g_url, :start_on, :end_on, :image)
      end

      def update_params
        params.require(:project).permit(:title, :content, :g_url, :start_on, :end_on, :image, :finish)
      end

      def correct_user
          @project = current_user.projects.find_by(id: params[:id])
          redirect_to root_url if @project.nil?
      end
end
