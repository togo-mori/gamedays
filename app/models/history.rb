class History < ApplicationRecord
  belongs_to :game
  has_one_attached :image
end
