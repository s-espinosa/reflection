class Cohort < ApplicationRecord
  has_many :students
  has_many :student_users, through: :students, source: :user
  has_many :instructors
  has_many :instructor_users, through: :instructors, source: :user

  def assigned_projects
    ids = student_users.joins(:assignments).pluck('assignments.project_id')
    Project.where(id: ids)
  end
end
