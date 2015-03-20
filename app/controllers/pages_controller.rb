class PagesController < ApplicationController
  def home
    @players = Player.with_game
  end
end
