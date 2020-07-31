class Game < ApplicationRecord
  has_many :histories
  validates :title, :maker, :series, :hard, :year, presence: true
end
