class ChangeDatatypeFinishOfProjects < ActiveRecord::Migration[6.0]
  def change
     change_column :projects, :finish, :boolean, default: false, null: false
  end
end
