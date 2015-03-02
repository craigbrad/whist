class GamesController < ApplicationController
  http_basic_authenticate_with name: "whist", password: "thisisasecret"

  before_action :set_game, only: [:show, :edit, :update]

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:notice] = "New Game Created!"
      redirect_to action: :edit, id: @game.id
    else
      render :new
    end
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

  private

  def game_params
    params.require(:game).permit(
      :number_of_rounds,
      :player_ids => [],
      :rounds_attributes => [
        :id, :trump,
        :trump_picker_id,
        :player_rounds_attributes => [:id, :bid, :contracts]
      ]
    )
  end

  def set_game
    @game = Game.find(params[:id])
  end
end