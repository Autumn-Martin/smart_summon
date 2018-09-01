require 'rails_helper'

RSpec.describe RoleChampion, type: :model do
  describe 'relationships' do
    it {should belong_to(:role)}
    it {should belong_to(:champion)}
  end
end
