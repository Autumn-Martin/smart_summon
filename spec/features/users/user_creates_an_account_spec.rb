require 'rails_helper'

describe 'User creates an account' do
  context 'user links from root' do
    context 'user fills out form and clicks submit' do
      scenario 'user creates a new user account' do

        visit '#root'
        click_on "Noob"

        expect(current_path).to eq(new_user_path)

        fill_in :user_name, with: "Leela"
        fill_in :user_email, with: "leela@gmail.com"
        fill_in :user_password, with: "1234"
        fill_in :user_password_confirmation, with: "1234"

        click_on "Get started!"

        user = User.last

        expect(current_path).to eq(champions_path)
        expect(page).to have_content("Welcome to Summoner's Rift")
        expect(user.name).to eq("Leela")
      end
    end
  end
end
