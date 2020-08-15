class Like < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :history, counter_cache: :likes_count
end
