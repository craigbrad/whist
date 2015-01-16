class Game < ActiveRecord::Base
  # RELATIONSHIPS

  has_and_belongs_to_many :players
  has_many :rounds
  has_many :player_rounds, through: :rounds

  # VALIDATIONS

  validates :number_of_rounds, inclusion: { in: 5..20 }

  validate do
    errors.add(:players, "requires more than one player") unless players.size > 1
  end

  # HOOKS

  before_create :fill_rounds

  # ATTRIBUTES

  accepts_nested_attributes_for :rounds

  private

  def fill_rounds
    self.rounds << Array.new(number_of_rounds) { rounds.new }
  end
end
