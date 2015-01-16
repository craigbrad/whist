class PlayerRound < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :player
  belongs_to :round
end
