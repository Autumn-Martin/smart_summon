class Skill < ApplicationRecord
  validates_presence_of :passive, :q, :w, :e, :r
  belongs_to :champion
end
