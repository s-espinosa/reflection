class RenameReflectionResponsesToResponses < ActiveRecord::Migration[5.1]
  def change
    rename_table :reflection_responses, :responses
  end
end
