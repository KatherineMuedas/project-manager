class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :name, :description, :project_id, presence: true

  validates_length_of :description, minimum: 10, too_short: 'please enter at least 10 characters'
  validates_numericality_of :delivery_minutes, :greater_than_or_equal_to => 1

end
