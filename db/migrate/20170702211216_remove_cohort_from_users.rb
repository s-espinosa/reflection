class RemoveCohortFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :cohort
  end
end
