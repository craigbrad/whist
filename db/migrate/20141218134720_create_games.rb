class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :number_of_rounds
      t.integer :number_of_players

      t.timestamps
    end
  end
end
