class AddTrumpToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :trump, :string
  end
end
