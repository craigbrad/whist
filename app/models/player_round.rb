class PlayerRound < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :player
  belongs_to :round

  # HOOKS

  before_save :calculate_score,
    if: Proc.new { |round| round.bid? && round.score? }

  # SCOPES

  default_scope { order("id asc") }

  def calculate_score
    self.score = contracts

    if bid == contracts
      self.score += 10
    end
  end
end
