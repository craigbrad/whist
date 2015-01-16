class Player < ActiveRecord::Base
  # RELATIONSHIPS

  has_and_belongs_to_many :games
  has_many :rounds, through: :games
  has_many :player_rounds

  def to_s
    full_name
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end
