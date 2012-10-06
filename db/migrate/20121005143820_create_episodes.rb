class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :number
      t.text :title
      t.date :first_shown
      t.text :synopsis

      t.timestamps
    end
    add_index :episodes, :number
    add_index :episodes, :title
  end
end
