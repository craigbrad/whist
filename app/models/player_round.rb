class PlayerRound < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :player
  belongs_to :round

  # HOOKS

  before_save :calculate_scores,
    if: Proc.new { |round| round.bid? && round.contracts? }

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

  private

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
end
