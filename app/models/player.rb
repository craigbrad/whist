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

  def average_trumps
    (trump_rounds_by_game.sum.to_f / trump_rounds_by_game.size)
  end

  def split_win_percentage
    # todo: do!
  end

  def first_split_win_percentage
    (first_split_rounds.count.to_f / first_rounds.count) * 100
  end

  def splits
    # where top score appears more than once
    # todo: HARD
  end

  def first_deal_percentage
    (first_rounds_as_dealer.count.to_f / first_rounds.count) * 100
  end

  def last_deal_percentage
    (last_rounds_as_dealer.count.to_f / last_rounds.count) * 100
  end

  # private

  # todo: convert to sql

  def contract_hits
    player_rounds.with_contract_hit.count
  end

  # todo: rename to _count?
  def finished_player_rounds
    player_rounds.finished.count.to_f
  end

  def last_round_scores
    player_rounds.last_round.pluck(:total_score)
  end

  def trump_rounds
    rounds.where(trump_picker: self)
  end

  def trump_rounds_by_game
    trump_rounds.group_by(&:game_id).map{ |_, v| v.count }
  end

  def first_rounds
    rounds.where(number: 1)
  end

  def first_rounds_as_dealer
    first_rounds.where(dealer: self)
  end

  def last_rounds
    rounds.joins(:game).where('rounds.number = games.number_of_rounds')
  end

  def last_rounds_as_dealer
    last_rounds.where(dealer: self)
  end
end
