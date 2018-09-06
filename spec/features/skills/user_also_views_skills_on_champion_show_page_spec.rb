require 'rails_helper'

feature 'User views champion show page' do
  context 'user links from role_champions_path' do
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
    end
    scenario 'also displays skills for a single champion' do
      role = create(:role)
      champion = create(:champion)

      skill = champion.skills.create(passive: "test", q: "test q", w: "test w", e: "test e", r: "test r")

      role.champions << champion

      visit role_champions_path(role)
      within ("#champion-#{champion.id}")
        click_on "More Details"

      expect(current_path).to eq(champion_path(champion))
      expect(page).to have_content(skill.passive)
      expect(page).to have_content(skill.q)
      expect(page).to have_content(skill.w)
      expect(page).to have_content(skill.e)
      expect(page).to have_content(skill.r)
    end
  end
end
