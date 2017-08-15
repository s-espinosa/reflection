class Cohort < ApplicationRecord
  has_many :student_users, foreign_key: "cohort_id", class_name: "User"
  has_many :instructor_users, foreign_key: "instructor_cohort_id", class_name: "User"

  def assigned_projects
    ids = student_users.joins(:assignments).pluck('assignments.project_id')
    Project.where(id: ids)
  end
end
