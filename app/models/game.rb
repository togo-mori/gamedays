class Game < ApplicationRecord
  has_many :histories
  has_many :users
  validates :title, :maker, :series, :hard, :year, presence: true
end
