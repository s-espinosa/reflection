class RemoveRoleFromCohortUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :cohort_users, :role, :integer
  end
end
