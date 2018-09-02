class Role < ApplicationRecord
  validates_presence_of :title
  has_many :role_champions
  has_many :champions, through: :role_champions, dependent: :destroy
end
