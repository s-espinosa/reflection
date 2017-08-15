class Project < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments
  has_many :questions
  has_many :prompts, through: :questions
  has_many :responses
  has_many :responded_users, through: :responses, source: :user

  def user_response?(user)
    responded_users.include?(user)
  end

  def safe_response(user, prompt)
    response = responses.find_by(user: user, prompt: prompt)

    response ? response.response : ""
  end
end
