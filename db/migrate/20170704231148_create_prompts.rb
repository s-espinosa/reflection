class CreatePrompts < ActiveRecord::Migration[5.1]
  def change
    create_table :prompts do |t|
      t.string :prompt
    end
  end
end
