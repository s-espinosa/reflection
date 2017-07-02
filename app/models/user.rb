class User < ApplicationRecord
  has_many :assignments
  has_many :assigned_projects, through: :assignments, source: :project
  has_many :cohort_users

  validates :name, presence: true

  enum role: ['default', 'instructor']

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.token = auth['credentials']['token']

    user.save
    user
  end

  def cohort
    cohort_users.where(role: "student").first.cohort
  end

  def teaching
    cohort_users.where(role: "instructor").first.cohort
  end
end
