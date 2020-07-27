class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new 
    @games = Game.all
    @game = Game.new
  end

  def create
    @games = Game.all
    Game.create(game_params) 
  end

  def show 
    @games = Game.all
    @game = Game.find(params[:id])
    @history = History.new
    @histories = @game.histories
  end

  def year
    @games = Game.all
    @titles = Game.where(year: params[:year])
  end

  private
  
  def game_params 
     params.require(:game).permit(:title,:maker,:series,:hard,:year)
  end
  
end
