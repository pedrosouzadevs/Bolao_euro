class Result < ApplicationRecord
  belongs_to :match
  belongs_to :team_a_id, class_name: 'Team'
  belongs_to :team_b_id, class_name: 'Team'
  belongs_to :winner_id, class_name: 'Team'
  after_save :refresh_bets

  private

  def refresh_bets
    bets = Bet.where(match_id: self.match_id)
    bets.each do |bet|
      bet.update_score(self.score_team_a, self.score_team_b, self.winner_id)
    end
  end
end
