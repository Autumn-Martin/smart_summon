require 'rails_helper'

feature 'User views index page' do
  context'user visits /roles' do
    scenario 'displays all roles' do
      role = create(:role)
      champion_1 = create(:champion, name: "Poppy")
      champion_2 = create(:champion, name: "Heimerdinger")
      role.champions << champion_1
      role.champions << champion_2

      visit roles_path
      click_on role.title

      expect(page).to have_content(champion_1.name)
      expect(page).to have_content(champion_2.name)

    end
  end
end
