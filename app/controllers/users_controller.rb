class UsersController < ApplicationController
  def ranking
    @users = User.all
    @users.each do |user|
      bets = Bet.where(user_id: user.id)
      bets.each do |bet|
        user.score = user.score + bet.score
      end
    end
    @admins = @users.select { |user| user.admin == true }
    @users = @users - @admins
    @users = @users.sort_by { |user| user.score }.reverse
  end

  def all_bets
    @matches = Match.where(round_id: 1)
    @users = User.all
    @admins = @users.select { |user| user.admin == true }
    @users = @users - @admins
    @users = @users.sort_by { |user| user.score }.reverse
  end
end
