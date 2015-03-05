class GamePlayersController < ApplicationController
  protect_from_forgery with: :null_session

  http_basic_authenticate_with name: "whist", password: "thisisasecret"

  def create
    player = Player.find(params[:player_id])
    game = Game.find(params[:game_id])

    @game_player = game.add_player(player)

    respond_to do |format|
      format.js { render_game_player }
    end
  end

  private

  def render_game_player
    render partial: 'game_player', 
      locals: { game_player: @game_player }, 
      layout: false
  end
end