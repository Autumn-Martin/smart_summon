require 'rails_helper'

RSpec.describe FavoriteChampion, type: :model do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:champion)}
  end
end
