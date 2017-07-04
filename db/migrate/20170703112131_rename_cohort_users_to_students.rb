class RenameCohortUsersToStudents < ActiveRecord::Migration[5.1]
  def change
    rename_table :cohort_users, :students
  end
end
