class Advert < ApplicationRecord
  belongs_to :user
  has_many :adverts_projects_joins,  dependent: :delete_all
  has_many :projects, through: :adverts_projects_joins

  has_one_attached :avatar
  
  validates :description, :price, :tag, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 5 }
  validates :tag, uniqueness: {scope: :user_id}

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
