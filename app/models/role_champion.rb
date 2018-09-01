class RoleChampion < ApplicationRecord
  belongs_to :role
  belongs_to :champion
end
