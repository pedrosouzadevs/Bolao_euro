class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  has_many :bet_champions
  has_many :teams, through: :bet_champions
  has_many :bets
  has_many :bet_first_rounds
  has_many :bet_second_rounds
  has_many :bet_third_rounds
  has_many :bet_finals

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
