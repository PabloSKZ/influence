class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :description
      t.string :img_url
      t.string :title

      t.timestamps
    end
  end
end
