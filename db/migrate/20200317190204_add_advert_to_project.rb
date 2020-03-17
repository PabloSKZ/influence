class AddAdvertToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :advert, foreign_key: true
  end
end
