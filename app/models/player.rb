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

  scope :with_game, -> { joins(:games).uniq }

  def to_s
    full_name
  end

  # todo: move to decorator

  def full_name
    [first_name, last_name].join(" ")
  end

  def initials
    first_name.first + last_name.first
  end

  def accuracy
     (contract_hits.to_f / finished_player_rounds) * 100
  end

  def average_score
    last_round_scores.sum / last_round_scores.size
  end

  private

  def contract_hits
    player_rounds.with_contract_hit.count
  end

  def finished_player_rounds
    player_rounds.finished.count.to_f
  end

  def last_round_scores
    player_rounds.last_round.pluck(:total_score)
  end
end
