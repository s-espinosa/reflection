class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to instructor_dashboard_path(current_user)
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
