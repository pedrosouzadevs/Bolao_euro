class UsersController < ApplicationController
  def ranking
    @users = User.all
    @users.each do |user|
      bets = Bet.where(user_id: user.id)
      bets.each do |bet|
        user.score =+ bet.score
      end
    end
    @users = @users.sort_by { |user| user.score }.reverse
  end
end
