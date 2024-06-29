class MatchesController < ApplicationController
  after_action :verify_authorized, except: :index

  def index
    @matches = Match.where(round_id: 1)
  end

  def my_bets
    @bets = Bet.where(user_id: current_user.id)
  end
end
