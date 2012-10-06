class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.text :role
      t.text :first_name
      t.text :middle_name
      t.text :surname
      t.text :biography
      t.boolean :cast

      t.timestamps
    end
    add_index :participants, :role
    add_index :participants, :first_name
    add_index :participants, :surname
  end
end
