class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.text :description
      t.decimal :price
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
  end
end
