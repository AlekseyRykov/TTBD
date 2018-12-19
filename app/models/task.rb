class Task < ApplicationRecord
  belongs_to :project

  has_many :subtasks, class_name: "Task", foreign_key: "parent_task_id", dependent: :destroy
  belongs_to :parent_task, class_name: "Task", optional: true

  validates :description, presence: true
end
