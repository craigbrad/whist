class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_many :rounds
end
