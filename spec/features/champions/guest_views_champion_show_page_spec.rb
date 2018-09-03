require 'rails_helper'

feature 'Guest views champion show page' do
  context 'guest links from role_champions_path' do
    scenario 'displays info for a single champion' do
      role = create(:role)
      champion = create(:champion)
      role.champions << champion

      visit role_champions_path(role)
      within ("#champion-#{champion.id}")
        click_on "More Details"

      expect(current_path).to eq(champion_path(champion))
      expect(page).to have_content(champion.name)
      expect(page).to have_content(champion.damage)
      expect(page).to have_content(champion.primary_class)
      expect(page).to have_content(champion.secondary_class)
      # expect(page).to have_content(champion.rune_path)
      # expect(page).to have_content(champion.skill_order)
    end
  end
end
