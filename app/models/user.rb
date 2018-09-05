class User < ApplicationRecord
  has_secure_password

  has_many :favorite_champions
  has_many :champions, through: :favorite_champions

  validates_presence_of :name
  validates :email, presence: true, uniqueness: true

  enum role: {default: 0, admin: 1}
end
