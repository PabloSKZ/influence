class CreateAdvertsProjectsJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :adverts_projects_joins do |t|
      t.belongs_to :advert, foreign_key: true
      t.belongs_to :project, foreign_key: true
      t.timestamps
    end
  end
end
