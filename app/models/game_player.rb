class GamePlayer < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :game
  belongs_to :player

  # SCOPES

  default_scope { order("position asc") }
end
