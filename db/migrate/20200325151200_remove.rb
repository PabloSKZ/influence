class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :city_id
  end
end
