class Project < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :adverts_projects_joins, dependent: :delete_all
  has_many :adverts, through: :adverts_projects_joins

  has_one_attached :cover
  
  validates :title, :description, presence: true 

  before_commit :cover_validation, on: :update
  validates :title, length: { minimum: 3, maximum: 32 }
  validates :description, length: { minimum: 50, maximum: 250 }
  validates :link_field, format: { with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :multiline => true }

  private

  def cover_validation
    if cover.attached?
      if !cover.blob.content_type.starts_with?('image/')
        cover.purge
        errors[:base] << 'Wrong format'
        render :edit
      end
    end
  end
end
