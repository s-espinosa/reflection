class CreateReflectionResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :reflection_responses do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.references :prompt, foreign_key: true
      t.string :response

      t.timestamps null: false
    end
  end
end
