require 'rails_helper'

feature 'User views index page' do
  context'user visits /roles' do
    scenario 'displays all roles' do
      role_1 = create(:role, title: "top")
      role_2 = create(:role, title: "jungle")
      role_3 = create(:role, title: "mid")
      role_4 = create(:role, title: "adc")
      role_5 = create(:role, title: "support")

      visit roles_path

      expect(page).to have_content(role_1.title)
      expect(page).to have_content(role_2.title)
      expect(page).to have_content(role_3.title)
      expect(page).to have_content(role_4.title)
      expect(page).to have_content(role_5.title)
    end
  end
end
