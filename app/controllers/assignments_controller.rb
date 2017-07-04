class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
    @students   = current_user.instructor_students
    @projects   = Project.all
  end

  def create
    @assignments = Assignment.create(assignment_params)
    redirect_to instructor_dashboard_path(current_user)
  end

  private
  def assignment_params
    user_ids.map do |user_id|
      {
        project_id: params['assignment']['project_id'],
        user_id: user_id
      }
    end
  end

  def user_ids
    params['assignment']['user_id'].reject { |id| id == "" }
  end
end

