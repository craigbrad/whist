class AddDealerToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :dealer_id, :integer
    add_index :rounds, :dealer_id
  end
end
