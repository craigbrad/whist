class PlayersController < ApplicationController
  http_basic_authenticate_with name: "whist", password: "thisisasecret"

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = 'Player created!'
      redirect_to action: :new
    else
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:first_name, :last_name)
  end
end