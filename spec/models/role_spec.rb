require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
  end
  describe 'relationships' do
    it {should have_many(:role_champions)}
    it {should have_many(:champions)}
  end 
end
