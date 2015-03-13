class AddTotalScoreToPlayerRounds < ActiveRecord::Migration
  def change
    add_column :player_rounds, :total_score, :integer
  end
end
