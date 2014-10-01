class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  has_many :users, through: :project_members
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  validates :name, :description, :due_date_at, presence: true
  
  validates_length_of :description, minimum: 10, too_short: 'please enter at least 10 characters'
  validate :due_in_future

  def due_in_future
    if due_date_at < Date.today 
      errors.add(:due_date_at, "cannot be in the past")
    end
  end
end