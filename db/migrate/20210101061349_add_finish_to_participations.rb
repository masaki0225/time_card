class AddFinishToParticipations < ActiveRecord::Migration[6.0]
  def change
    add_column :participations, :finish, :boolean, default: false
  end
end
