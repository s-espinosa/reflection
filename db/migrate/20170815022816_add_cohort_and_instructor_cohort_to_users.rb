class AddCohortAndInstructorCohortToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cohort_id, :integer
    add_column :users, :instructor_cohort_id, :integer
    add_index :users, :cohort_id
    add_index :users, :instructor_cohort_id
    drop_table :students
    drop_table :instructors
  end
end
