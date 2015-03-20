class Game < ActiveRecord::Base
  # RELATIONSHIPS

  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players
  has_many :rounds, dependent: :destroy
  has_many :player_rounds, through: :rounds

  # VALIDATIONS

  validates :number_of_rounds, inclusion: { in: 5..20 }

  # validate do
  #   errors.add(:players, "requires more than one player") unless players.size > 1
  # end

  # HOOKS

  # before_create :fill_rounds

  # todo: add default scope to only include games which are finished

  # ATTRIBUTES

  accepts_nested_attributes_for :rounds

  def add_player(player)
    game_players.create(
      player: player,
      position: game_players.length + 1
    )
  end

  def start_game
    fill_rounds!
  end

  private

  def fill_rounds!
    return if rounds_filled?

    (1..number_of_rounds).each do |round_num|
      self.rounds.new(
        number: round_num,
        dealer: dealers_for_rounds[round_num]
      )
    end

    save
  end

  def rounds_filled?
    rounds.count > 0
  end

  def dealers_for_rounds
    @dealers_for_rounds ||= dealers.unshift(nil)
  end

  def dealers
    # todo: omg refactor
    @dealers ||= (players * (number_of_rounds / players.count.to_f).ceil).slice(0, number_of_rounds)
  end
end
