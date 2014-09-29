class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :tasks, reject_if: proc { |attributes| attributes['name'].blank? }, allow_destroy: true
  validates :name, :description, :due_date_at, presence: true
end
