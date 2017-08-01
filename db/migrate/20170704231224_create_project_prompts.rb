class CreateProjectPrompts < ActiveRecord::Migration[5.1]
  def change
    create_table :project_prompts do |t|
      t.references :project, foreign_key: true
      t.references :prompt, foreign_key: true
    end
  end
end
