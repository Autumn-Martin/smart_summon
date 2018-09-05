require 'rails_helper'

feature 'Guest views champion index page' do
  context 'guest visits champions_path' do
    scenario 'displays all champions' do
      champion_1 = create(:champion, name: "Poppy", damage: "tank")
      champion_2 = create(:champion, name: "Heimerdinger", damage: "magic")
      visit champions_path

      expect(page).to have_content(champion_1.name)
      expect(page).to have_content(champion_1.damage)
      expect(page).to have_content(champion_2.name)
      expect(page).to have_content(champion_2.damage)
    end
  end
end
