class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :position

      t.timestamps
    end

    add_index :game_players, [:game_id, :player_id]
  end
end
