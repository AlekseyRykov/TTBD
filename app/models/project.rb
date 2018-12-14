class Project < ApplicationRecord
  has_many :subprojects, class_name: "Project", foreign_key: "parent_project_id", dependent: :destroy
  belongs_to :parent_project, class_name: "Project", optional: true

  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
