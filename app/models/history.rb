class History < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :date, presence: true
  validates :text, presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
