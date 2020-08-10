class GamesController < ApplicationController
  before_action :move_to_sign_in   

  def index
    @games = Game.all
  end

  def new 
    @games = Game.all
    @game = Game.new
  end

  def create
    @games = Game.all
    @game = Game.new(game_params)
    if @game.save
      redirect_to root_path
    else
      redirect_to new_game_path
    end
  end

  def show 
    @games = Game.all
    @game = Game.find(params[:id])
    @history = History.new
    @histories = @game.histories
  end

  def destroy 
    game = Game.find(params[:id])
    game.destroy
    redirect_to "/games"
  end


  def year
    @games = Game.all
    @titles = Game.where(year: params[:year])
  end

  private
  
  def game_params 
     params.require(:game).permit(:title,:maker,:series,:hard,:year).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end
  
end
