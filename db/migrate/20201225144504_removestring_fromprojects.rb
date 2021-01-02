class RemovestringFromprojects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :string, :string
  end
end
