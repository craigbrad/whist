class AddScoresToPlayerRounds < ActiveRecord::Migration
  def change
    add_column :player_rounds, :score, :integer, default: 0
  end
end
