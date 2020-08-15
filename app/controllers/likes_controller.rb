class LikesController < ApplicationController

  def create
    @history = History.find(params[:history_id])
    @like = Like.create(like_params)
  end

  def destroy
    @history = History.find(params[:history_id])
    @like = Like.find_by(history_id: @history.id, user_id: current_user.id)
    @like.destroy
  end

  private 
  
  def like_params
    params.permit(:user_id, :history_id, :game_id).merge(user_id: current_user.id)
  end

end
