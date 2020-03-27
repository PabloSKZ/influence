class Advert < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :adverts_projects_joins,  dependent: :delete_all
  has_many :projects, through: :adverts_projects_joins

  has_one_attached :avatar
  
  validates :description, :price, :tag, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :tag, uniqueness: {scope: :user_id}
  validates :link_field, format: { with: /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix,
      message: "mauvais format", :multiline => true }
  
  before_commit :avatar_validation, on: :update
  private

  def avatar_validation
    if avatar.attached?
      if !avatar.blob.content_type.starts_with?('image/')
        avatar.purge
        errors[:base] << 'Wrong format'
        render :edit
      end
    end
  end

end
