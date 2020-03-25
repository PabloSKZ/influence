class City < ApplicationRecord
    has_many :users
    has_many :adverts
    has_many :projects
end
