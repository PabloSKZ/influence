class Advert < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins,  dependent: :delete_all
  has_many :projects, through: :adverts_projects_joins
  validates :title, :description, :price, :tag, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 5 }
end
