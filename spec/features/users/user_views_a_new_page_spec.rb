require 'rails_helper'

describe 'User views a new user form' do
  context 'user links from root' do
    scenario 'user views a new user form' do
      visit '#root'
      click_on "Noob"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Please enter your info to get started.")
      expect(page).to have_content("Name:")
      expect(page).to have_content("Email:")
      expect(page).to have_content("Password:")
      expect(page).to have_content("Password Confirmation:")
    end
  end
end
