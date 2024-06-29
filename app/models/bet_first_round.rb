class BetFirstRound < ApplicationRecord
  belongs_to :match_1, class_name: 'Bet'
  belongs_to :match_2, class_name: 'Bet'
  belongs_to :match_3, class_name: 'Bet'
  belongs_to :match_4, class_name: 'Bet'
  belongs_to :match_5, class_name: 'Bet'
  belongs_to :match_6, class_name: 'Bet'
  belongs_to :match_7, class_name: 'Bet'
  belongs_to :match_8, class_name: 'Bet'
  belongs_to :user

  validates :match_1, presence: true
  validates :match_2, presence: true
  validates :match_3, presence: true
  validates :match_4, presence: true
  validates :match_5, presence: true
  validates :match_6, presence: true
  validates :match_7, presence: true
  validates :match_8, presence: true
end
