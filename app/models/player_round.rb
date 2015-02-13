class PlayerRound < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :player
  belongs_to :round

  # SCOPES

  default_scope { order("id asc") }
end
