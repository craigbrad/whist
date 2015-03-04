class GamePlayer < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :game
  belongs_to :player
end
