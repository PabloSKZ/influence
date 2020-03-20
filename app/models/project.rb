class Project < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins, dependent: :delete_all
  has_many :adverts, through: :adverts_projects_joins
  
  validates :title, :description, presence: true 
end
