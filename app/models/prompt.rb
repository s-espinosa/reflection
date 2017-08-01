class Prompt < ApplicationRecord
  has_many :project_prompts
  has_many :projects, through: :project_prompts
end
