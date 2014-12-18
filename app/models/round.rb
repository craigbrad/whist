class Round < ActiveRecord::Base
  belongs_to :game
  has_many :players, through: :game
end
