class GamesController < ApplicationController
  http_basic_authenticate_with name: "whist", password: "thisisasecret"

  before_action :set_game, only: [:show, :edit, :update, :select_players, :start]

  def index
    @games = Game.order("created_at ASC").all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to action: :select_players, id: @game.id
    else
      render :new
    end
  end

  def select_players
    @available_players = Player.not_in_game(@game)
  end

  def start
    @game.start_game

    redirect_to action: :edit, id: @game.id
  end

  def edit
  end

  def update
    if @game.update(game_params)
      flash[:notice] = "Updated Game!"
      render :edit
    else
      render :edit
    end
  end

  def build_games
    @players = Player.all.sample(builder_params[:number_of_players].to_i)
    render :builder
  end

  private

  def game_params
    params.require(:game).permit(
      :number_of_rounds,
      :date,
      :rounds_attributes => [
        :id, :trump,
        :trump_picker_id,
        :player_rounds_attributes => [:id, :bid, :contracts]
      ]
    )
  end

  def builder_params
    params.permit(:number_of_players)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end