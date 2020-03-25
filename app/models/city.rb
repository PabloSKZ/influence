class City < ApplicationRecord
    has_many :adverts
    has_many :projects
end
