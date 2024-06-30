class Result < ApplicationRecord
  belongs_to :match
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id'
  belongs_to :team_a, class_name: 'Team', foreign_key: 'team_a_id'
  belongs_to :team_b, class_name: 'Team', foreign_key: 'team_b_id'
  after_save :refresh_bets

  private

  def refresh_bets
    bets = Bet.where(match_id: self.match_id)
    bets.each do |bet|
      bet.update_score(self.score_team_a, self.score_team_b, self.winner_id)
    end
  end
end
