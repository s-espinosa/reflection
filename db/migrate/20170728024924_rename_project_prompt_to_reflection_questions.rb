class RenameProjectPromptToReflectionQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_table :project_prompts, :reflection_questions
  end
end
