class CreateAdverts < ActiveRecord::Migration[5.2]
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.string :picture
      t.string :link_field
      t.string :price
      t.string :tag
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end