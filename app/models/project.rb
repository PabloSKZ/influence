class Project < ApplicationRecord
  has_many :adverts
  belongs_to :user
end
