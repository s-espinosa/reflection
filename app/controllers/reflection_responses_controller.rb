class ReflectionResponsesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
  end

  def create
    @project   = Project.find(params[:project_id])
    responses = create_responses(params[:reflection_questions])
    if ReflectionResponse.create(responses)
      redirect_to user_path(current_user)
    else
      flash[:error] = "Something went wrong. Try again."
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @current_user = current_user
  end

  private
  def create_responses(responses)
    cleaned_responses = []
    responses.each do |id, response|
      cleaned_responses << {response: response, prompt_id: id.to_i, project_id: @project.id, user_id: current_user.id}
    end
    cleaned_responses
  end
end
