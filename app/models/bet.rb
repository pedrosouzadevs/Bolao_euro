class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :bets
  has_many :bet_first_rounds
  has_many :bet_second_rounds
  has_many :bet_third_rounds
  has_many :bet_finals
  validates :score_team_a, :score_team_b, :winner_id, presence: true
  validates :user_id, uniqueness: { scope: :match_id, message: "You can only bet once per match" }
  validate :validates_bet


  def validates_bet
    if self.score_team_a > self.score_team_b && self.winner_id != self.match.team_a_id
      errors.add(:winner_id, "Winner must be Team A")
    elsif self.score_team_a < self.score_team_b && self.winner_id != self.match.team_b_id
      errors.add(:winner_id, "Winner must be Team B")
    end
  end

  def update_score(score_team_a, score_team_b, winner_id)
    if self.score_team_a == score_team_a && self.score_team_b == score_team_b && self.winner == winner_id
      self.update(score: 10)  # Pontuação arbitrária para exemplo
    elsif self.score_team_a == score_team_a || self.score_team_b == score_team_b && self.winner == winner_id
      self.update(score: 7)
    elsif self.winner == winner_id
      self.update(score: 5)
    elsif self.score_team_a == score_team_a && self.score_team_b == score_team_b && self.winner != winner_id
      self.update(score: 5)
    elsif self.score_team_a == score_team_a || self.score_team_b == score_team_b
      self.update(score: 2)
    else
      self.update(score: 0)
    end
  end
end
