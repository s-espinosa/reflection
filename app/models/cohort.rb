class Cohort < ApplicationRecord
  has_many :cohort_users
  has_many :users, through: :cohort_users

  def students
    users.merge(CohortUser.students)
  end

  def assigned_projects
    ids = students.joins(:assignments).pluck('assignments.project_id')
    Project.where(id: ids)
  end
end
