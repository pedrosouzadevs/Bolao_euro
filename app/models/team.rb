class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bet_champions
  has_many :users, through: :bet_champions
  has_many :matches_as_team_a, class_name: 'Match', foreign_key: 'team_a_id'
  has_many :matches_as_team_b, class_name: 'Match', foreign_key: 'team_b_id'
  has_many :matches_as_team_a, class_name: 'Result', foreign_key: 'team_a_id'
  has_many :matches_as_team_b, class_name: 'Result', foreign_key: 'team_b_id'
end
