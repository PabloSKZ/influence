class AddColumnStatusToJoinTable < ActiveRecord::Migration[5.2]
  def change
    add_column :adverts_projects_joins, :status, :string
  end
end
