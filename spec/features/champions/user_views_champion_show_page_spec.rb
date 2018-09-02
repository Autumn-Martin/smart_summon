require 'rails_helper'

feature 'User views champion show page' do
  context 'user links from role_champions_path' do
    scenario 'displays info for a single champion' do
      role = create(:role)
      champion = create(:champion)
      role.champions << champion

      visit role_champions_path(role)
      click_on champion.name

      expect(current_path).to eq(champion_path(champion))
      expect(page).to have_content(champion.name)

    end
  end
end
