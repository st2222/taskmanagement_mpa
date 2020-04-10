class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :task_branches, dependent: :delete_all
end
