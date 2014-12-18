class CreateGamesPlayers < ActiveRecord::Migration
  def change
    create_table :games_players do |t|
      t.integer :game_id
      t.integer :player_id
    end

    add_index :games_players, [:game_id, :player_id], unique: true
  end
end
