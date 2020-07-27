class HistoriesController < ApplicationController
  def create
    history = History.create(history_params)
    redirect_to "/games/#{history.game.id}"
  end

  def show 
    @games = Game.all
    @history = History.find(params[:id])
  end

  private 
  
  def history_params
   params.require(:history).permit(:text, :image, :date).merge(game_id: params[:game_id])
  end
end
