class BetFinal < ApplicationRecord
  belongs_to :match_1, class_name: 'Bet'
  belongs_to :user
  validates :match_1, presence: true
end
