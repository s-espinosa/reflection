class Instructor < ApplicationRecord
  belongs_to :user
  belongs_to :cohort
end
