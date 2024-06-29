class MatchesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @matches = Match.where(round_id: 1)
  end

  def my_bets
    @bets = Bet.where(user_id: current_user.id)
  end
end
