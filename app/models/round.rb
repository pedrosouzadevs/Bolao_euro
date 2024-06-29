class Round < ApplicationRecord
  has_many :matches
  validates :stage, presence: true, uniqueness: true
end
