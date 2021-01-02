class RemoveStringFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :string
  end
end
