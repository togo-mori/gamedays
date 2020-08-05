class History < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_one_attached :image
  validates :date, :text, presence: true
end
