class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :game_id
      t.integer :number
      t.datetime :start_at
      t.datetime :end_at

      t.integer :trump_picker_id
      t.string :trumps

      t.timestamps
    end

    add_index :rounds, :game_id
    add_index :rounds, :trump_picker_id
  end
end
