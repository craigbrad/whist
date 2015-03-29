class PlayerRound < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :player
  belongs_to :round

  # HOOKS

  before_save :calculate_scores,
    if: Proc.new { |round| round.bid != nil && round.contracts != nil }

  # SCOPES

  default_scope { order("player_rounds.id asc") }

  scope :finished, -> {
    where("bid IS NOT NULL and contracts IS NOT NULL")
  }

  scope :with_contract_hit, -> {
    where("bid = contracts")
  }

  scope :last_round, -> {
    joins(:round => :game).where("rounds.number = games.number_of_rounds")
  }

  scope :max_contracts, -> {
    unscoped.select('Max(id) AS id', :round_id, 'Max(contracts) AS contracts').group(:round_id)
  }

  scope :rounds_with_split_and_contracts, -> {
    unscoped.select(:round_id, 'Count(1)').
    joins("INNER JOIN (#{max_contracts.to_sql})
           AS max_contracts ON player_rounds.round_id=max_contracts.round_id
           AND player_rounds.contracts=max_contracts.contracts").
    group('player_rounds.round_id').having('Count(1) > 1')
  }

  scope :rounds_with_split, -> {
    unscoped.select('round_id ').distinct.from("(#{rounds_with_split_and_contracts.to_sql}) AS rounds")
  }

  scope :number_of_splits, -> {
    unscoped.select('Count(1) AS count').from("(#{rounds_with_split.to_sql}) AS splits")
  }

  def previous?
    previous.present?
  end

  def previous
    if previous_round
      previous_round.player_rounds.where(player: player).first
    end
  end

  def previous_round
    round.previous
  end

  # private

  def calculate_score
    self.score = contracts

    if bid == contracts
      self.score += 10
    end

    self.score
  end

  def calculate_scores
    total_score = 0

    if previous?
      total_score = previous.total_score
    end

    self.total_score = total_score + calculate_score
  end

  def self.num_of_splits
    number_of_splits.to_a.first.count
  end
end
