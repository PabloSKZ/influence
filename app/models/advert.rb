class Advert < ApplicationRecord
  belongs_to :user
  belongs_to :project
  # validates :title, :description, :price, :tag, presence: true --- a decommenter lorsque pret a utiliser
end
