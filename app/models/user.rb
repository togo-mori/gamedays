class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: {case_sensitive: true}, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: {case_sensitive: true}
  has_many :histories
  has_many :games
  
end