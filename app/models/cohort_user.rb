class CohortUser < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  enum role: ["student", "instructor"]

  scope :student_cohort, -> { where(role: "student").first.cohort }
  scope :teaching_cohort, -> { where(role: "instructor").first.cohort }
end
