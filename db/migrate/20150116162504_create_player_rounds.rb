class CreatePlayerRounds < ActiveRecord::Migration
  def change
    create_table :player_rounds do |t|
      t.integer :player_id
      t.integer :round_id
      t.integer :bid
      t.integer :contracts

      t.timestamps
    end

    add_index :player_rounds, [:player_id, :round_id], unique: true
  end
end
