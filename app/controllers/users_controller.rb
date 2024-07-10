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
    @matches_1 = Match.where(round_id: 1)
    @matches_2 = Match.where(round_id: 2)
    @matches_3 = Match.where(round_id: 3)
    @matches_4 = Match.where(round_id: 4)
    @matches = @matches_3 + @matches_2 + @matches_1
    @users = User.all
    @admins = @users.select { |user| user.admin == true }
    @users = @users - @admins
    @users = @users.sort_by { |user| user.score }.reverse
  end
end
