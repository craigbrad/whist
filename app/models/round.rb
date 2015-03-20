class Round < ActiveRecord::Base
  # RELATIONSHIPS

  belongs_to :game
  belongs_to :trump_picker, class_name: Player
  belongs_to :dealer, class_name: Player

  has_many :players, through: :game
  has_many :player_rounds, dependent: :destroy

  # VALIDATIONS

  # validate do
  #   errors.add(:trump_picker, "is not part of game") unless trump_picker.in? players
  # end

  # HOOKS

  before_create :fill_player_rounds

  # SCOPES

  default_scope { order("rounds.number asc") }

  scope :count_by_trump, -> {
    select('trump').group('trump').reorder('').count
  }

  # ATTRIBUTES

  accepts_nested_attributes_for :player_rounds

  TRUMPS = %w(hearts diamonds clubs spades)

  def previous
    game.rounds.where(number: number - 1).first
  end

  private

  def fill_player_rounds
    self.player_rounds << players.inject([]) do |rounds, player|
      rounds = player_rounds.new(player: player)
    end
  end
end
