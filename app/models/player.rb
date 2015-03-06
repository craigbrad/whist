class Player < ActiveRecord::Base
  # RELATIONSHIPS

  has_many :game_players
  has_many :games, through: :game_players
  has_many :rounds, through: :games
  has_many :player_rounds

  # SCOPES

  scope :not_in_game, ->(game) {
    where.not(id: game.player_ids)
  }

  def to_s
    full_name
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def initials
    first_name.first + last_name.first
  end
end
