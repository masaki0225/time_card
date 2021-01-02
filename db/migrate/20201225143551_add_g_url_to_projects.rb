class AddGUrlToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :g_url, :string
    add_column :projects, :string, :string
  end
end
