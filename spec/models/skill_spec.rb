require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:passive)}
    it {should validate_presence_of(:q)}
    it {should validate_presence_of(:w)}
    it {should validate_presence_of(:e)}
    it {should validate_presence_of(:r)}
  end
  describe 'relationships' do
    it {should belong_to(:champion)}
  end
end
