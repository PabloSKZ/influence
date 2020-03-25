class Project < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :adverts_projects_joins, dependent: :delete_all
  has_many :adverts, through: :adverts_projects_joins

  has_one_attached :cover
  
  validates :title, :description, presence: true 
end
