class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :name, :description, :delivery_minutes, :project_id, presence: true
end
