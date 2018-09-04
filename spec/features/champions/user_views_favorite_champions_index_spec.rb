# As a logged in user
# when I visit homepage
# and I click on a role
# then I see a list of champions for that role
# that I have marked as favorites
#
require 'rails_helper'
#
feature 'User views favorite champions' do
  context 'as a logged in user' do
    before do
      user = User.create(name: "Leia", email: "leia@email.com", password: "123", password_confirmation: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    context 'on the homepage' do
      before do
        visit '/'
      end
#
      context 'when I click on a role with favorited champions' do
        let!(:favorite_champion) { create(:champion, favorite: true) }
        let!(:lame_champion) { create(:champion, favorite: false) }
        let!(:role) { create(:role) }

        before do
          role.champions << favorite_champion
          role.champions << lame_champion
          click_on role.title
        end
#
        scenario 'I view a list of favorite champions for that role' do
          expect(page).to have_content favorite_champion.name
        end

        scenario 'I do not see unfavorited champions' do
          expect(page).to_not have_content lame_champion.name
        end
      end
    end
  end
end
