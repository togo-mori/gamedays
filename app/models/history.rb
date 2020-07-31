class History < ApplicationRecord
  belongs_to :game
  has_one_attached :image
  validates :date, :text, presence: true
end
