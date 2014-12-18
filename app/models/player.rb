class Player < ActiveRecord::Base
  has_and_belongs_to_many :games
  has_many :rounds, through: :games

  def to_s
    [first_name, last_name].join(" ")
  end
end
