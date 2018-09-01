class Champion < ApplicationRecord
  validates_presence_of :name
  has_many :role_champions
  has_many :roles, through: :role_champions
end
