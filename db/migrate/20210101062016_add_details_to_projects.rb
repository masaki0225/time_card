class AddDetailsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :finish, :boolean, default: false
  end
end
