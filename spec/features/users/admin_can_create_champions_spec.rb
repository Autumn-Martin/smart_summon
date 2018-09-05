require 'rails_helper'

feature 'User can create champions' do
  context 'as an admin on the new champion page' do
    context 'I fill out the form' do
      context 'I click submit' do
        scenario 'it creates a new champion' do
          admin = User.create(name: "Hagrid", email: "hagrid@hogwarts.com", password: "dragon", role: 1)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

          visit new_admin_champion_path

          fill_in :champion_name, with: "Firenz"
          fill_in :champion_damage, with: "magic"
          fill_in :champion_primary_class, with: "mage"
          fill_in :champion_secondary_class, with: "assassin"
          click_on "Create Champion"

          champion = Champion.last

          expect(current_path).to eq(admin_champion_path(champion))
          expect(page).to have_content(champion.name)
        end
      end
    end
  end
end
