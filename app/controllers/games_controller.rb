class GamesController < ApplicationController
  def show
    # if existing game
    # show existing game (first round)
    # else
    # show overview
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      # go to first round
      # redirect_to :show
    else
      # render with errors
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :number_of_rounds,
      :players => []
    )
  end
end