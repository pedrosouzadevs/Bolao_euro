class BetChampionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @bets = BetChampion.all
  end

  def new
    @bet = BetChampion.new
    @teams = Team.all.map { |team| [team.name, team.id] }
  end

  def create
    @bet = BetChampion.new(strong_params)
    @bet.user_id = current_user.id
    if @bet.save
      redirect_to root_path, notice: 'Bet was successfully created.'
    else
      if @bet.errors.full_messages.to_sentence == "User You can only bet once for the champion"
        redirect_to new_match_bet_path(params[:match_id]), alert: "You can only bet once for the champion"
      else
        redirect_to new_match_bet_path(params[:match_id]), alert: "#{@bet.errors.full_messages.to_sentence}"
      end
    end
  end

  private

  def strong_params
    params.require(:bet_champion).permit(:team_id)
  end
end
