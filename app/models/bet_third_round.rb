class BetThirdRound < ApplicationRecord
  belongs_to :match_1, class_name: 'Bet'
  belongs_to :match_2, class_name: 'Bet'
  belongs_to :user
  validates :match_1, presence: true
  validates :match_2, presence: true
end
