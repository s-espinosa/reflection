class CohortUser < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  enum role: ["student", "instructor"]

  scope :students, -> { where(role: "student") }
end
