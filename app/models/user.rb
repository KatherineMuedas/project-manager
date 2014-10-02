class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :tasks, through: :projects
  has_many :project_members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # before_validation :sanitize_phone

  validates :name, :phone, presence: true
          
end
