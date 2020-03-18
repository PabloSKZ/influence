class Advert < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins
  has_many :projects, through: :adverts_projects_joins
  validates :title, :description, :price, :tag, presence: true
end
