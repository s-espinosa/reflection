class User < ApplicationRecord
  has_many :assignments
  has_many :assigned_projects, through: :assignments, source: :project
  has_one :student
  has_one :cohort, through: :student
  has_one :instructor
  has_one :instructor_cohort, through: :instructor, source: :cohort
  has_many :reflection_responses

  validates :name, presence: true

  enum role: ['student', 'instructor']

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

  def instructor_students
    instructor_cohort.student_users
  end

  def instructor_projects
    instructor_cohort.assigned_projects
  end
end
