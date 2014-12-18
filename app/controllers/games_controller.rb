class GamesController < ApplicationController
  before_action :set_game, only: :show

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
      flash[:notice] = "New Game Created!"
      render :show
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :number_of_rounds,
      :player_ids => []
    )
  end

  def set_game
    @game = Game.find(params[:id])
  end
end