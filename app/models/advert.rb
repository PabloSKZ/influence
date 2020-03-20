class Advert < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins,  dependent: :delete_all
  has_many :projects, through: :adverts_projects_joins
  validates :title, :description, :price, :tag, presence: true
end
