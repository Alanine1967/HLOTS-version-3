class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :number
      t.date :first_shown

      t.timestamps
    end
  end
end
