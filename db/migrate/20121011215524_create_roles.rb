class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :episode_id
      t.integer :participant_id

      t.timestamps
    end
    add_index :roles, :episode_id
    add_index :roles, :participant_id
  end
end
