class ProjectsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user, only: [:destroy]
    
    def new
        @project = current_user.projects.build
    end
    
    def show
        @project = current_user.projects.find_by(id: params[:id])
    end
    
    def create
        @project = current_user.projects.build(project_params)
        @project.image.attach(params[:project][:image])
        if @project.save
            flash[:success] = "ケツイを力に変えるんだ！"
            redirect_to root_url
        else
            render "new"
        end 
    end
    
    def destroy
        @project.destroy
        flash[:success] = "プロジェクトを削除しました"
        redirect_to request.referrer || root_url
    end
    
    private
    
      def project_params
          params.require(:project).permit(:title, :content, :image)
      end 
      
      def correct_user
          @project = current_user.projects.find_by(id: params[:id])
          redirect_to root_url if @project.nil?
      end 
end
