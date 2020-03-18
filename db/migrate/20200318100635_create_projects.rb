class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.text :description
      t.string :img_url
      t.string :title
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
