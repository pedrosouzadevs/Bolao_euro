class Match < ApplicationRecord
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :round
  validates :team_a, presence: true, uniqueness: { scope: :round_id }
  validates :team_b, presence: true, uniqueness: { scope: :round_id }
  validates :round_id, presence: true
end
