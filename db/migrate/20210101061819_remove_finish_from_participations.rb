class RemoveFinishFromParticipations < ActiveRecord::Migration[6.0]
  def change
    remove_column :participations, :finish, :boolean
  end
end
