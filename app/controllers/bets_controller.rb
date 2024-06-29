class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(strong_params)
    @bet.user_id = current_user.id
    @bet.match_id = params[:match_id]

    if @bet.save
      redirect_to root_path, notice: 'Bet was successfully created.'
    else
      if @bet.errors.full_messages.to_sentence == "User You can only bet once per match"
        redirect_to new_match_bet_path(params[:match_id]), alert: "You can only bet once per match"
      else
        redirect_to new_match_bet_path(params[:match_id]), alert: "#{@bet.errors.full_messages.to_sentence}"
      end
    end

  end

  private

  def strong_params
    params.require(:bet).permit(:score_team_a, :score_team_b, :winner_id)
  end
end
