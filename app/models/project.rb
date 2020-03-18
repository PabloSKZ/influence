class Project < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins
  has_many :adverts, through: :adverts_projects_joins
  
  # validates :title, :description, presence: true --- a decommenter lorsque pret a utiliser
end
