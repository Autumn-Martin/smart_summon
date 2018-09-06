require 'rails_helper'

RSpec.describe Champion, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it {should have_many(:role_champions)}
    it {should have_many(:roles)}
    it {should have_many(:skills)}
  end
end
