require 'rails_helper'

feature 'Guest views show page' do
  context 'guest links from roles' do
    scenario 'displays all champions for that role' do
      role = create(:role)
      champion_1 = create(:champion, name: "Poppy", damage: "tank")
      champion_2 = create(:champion, name: "Heimerdinger", damage: "magic")
      role.champions << champion_1
      role.champions << champion_2

      visit roles_path
      click_on role.title


      expect(current_path).to eq(role_path(role))
      expect(page).to have_content("#{role.title}")
      expect(page).to have_content(champion_1.name)
      expect(page).to have_content(champion_1.damage)
      expect(page).to have_content(champion_2.name)
      expect(page).to have_content(champion_2.damage)
    end
  end
end
