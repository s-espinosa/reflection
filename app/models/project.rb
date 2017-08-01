class Project < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  has_many :reflection_questions
  has_many :prompts, through: :reflection_questions
  has_many :reflection_responses
  has_many :responded_users, through: :reflection_responses, source: :user

  def user_response?(user)
    responded_users.include?(user)
  end

  def safe_response(user, prompt)
    reflection = reflection_responses.find_by(user: user, prompt: prompt)

    reflection ? reflection.response : ""
  end
end
