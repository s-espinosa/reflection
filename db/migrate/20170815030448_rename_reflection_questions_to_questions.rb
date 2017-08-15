class RenameReflectionQuestionsToQuestions < ActiveRecord::Migration[5.1]
  def change
    rename_table :reflection_questions, :questions
  end
end
