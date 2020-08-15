class Game < ApplicationRecord
  has_many :histories
  has_many :likes
  has_many :users
  validates :title, presence: true
  validates :maker, presence: true
  validates :series, presence: true
  validates :hard, presence: true
  validates :year, presence: true
end
