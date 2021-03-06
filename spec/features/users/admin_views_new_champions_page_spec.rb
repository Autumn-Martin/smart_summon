require 'rails_helper'

feature 'User views new champions page' do
  context 'as an admin' do
    context 'I click on Create New Champion on the admin champions index page' do
      scenario 'it displays a new champion form' do

        admin = User.create(name: "Hagrid", email: "hagrid@hogwarts.com", password: "dragon", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_champions_path

        click_on "Create New Champion"

        expect(current_path).to eq(new_admin_champion_path)
        expect(page).to have_content("Name")
        expect(page).to have_content("Damage")
        expect(page).to have_content("Primary class")
        expect(page).to have_content("Secondary class")
        expect(page).to have_selector("input[type=submit][value='Create Champion']")
      end
    end
  end
end
