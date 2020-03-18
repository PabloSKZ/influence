class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.text :description
      t.string :picture
      t.string :title
      t.string :link_field
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
