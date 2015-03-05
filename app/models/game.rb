class Game < ActiveRecord::Base
  # RELATIONSHIPS

  has_many :game_players
  has_many :players, through: :game_players
  has_many :rounds
  has_many :player_rounds, through: :rounds

  # VALIDATIONS

  validates :number_of_rounds, inclusion: { in: 5..20 }

  # validate do
  #   errors.add(:players, "requires more than one player") unless players.size > 1
  # end

  # HOOKS

  # before_create :fill_rounds

  # ATTRIBUTES

  accepts_nested_attributes_for :rounds

  def add_player(player)
    game_players.create(
      player: player,
      position: game_players.length + 1
    )
  end

  def fill_rounds!
    if rounds.count == 0
      (1..number_of_rounds).each do |round_num|
        self.rounds.new(number: round_num)
      end
    end
  end
end
