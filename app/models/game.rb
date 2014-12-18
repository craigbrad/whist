class Game < ActiveRecord::Base
  # RELATIONSHIPS
  has_and_belongs_to_many :players
  has_many :rounds

  # VALIDATIONS
  validates :number_of_rounds, inclusion: { in: 5..20 }

  validate do
    errors.add(:players, "requires more than one player") unless players.size > 1
  end
end
