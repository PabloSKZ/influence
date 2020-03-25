class AddCityIdToAdverts < ActiveRecord::Migration[5.2]
  def change
    add_reference :adverts, :city, foreign_key: true
    add_reference :projects, :city, foreign_key: true
  end
end
