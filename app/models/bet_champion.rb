class BetChampion < ApplicationRecord
  belongs_to :user
  belongs_to :team, class_name: 'Team'
  validates :user, presence: true
  validates :team, presence: true
  validates :user_id, uniqueness: true
end
