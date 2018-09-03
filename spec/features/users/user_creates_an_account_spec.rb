require 'rails_helper'

describe 'User creates an account' do
  context 'user links from root' do
    context 'user fills out form and clicks submit' do
      scenario 'user creates a new user account' do

        visit '#root'
        click_on "Noob"

        expect(current_path).to eq(new_user_path)

        fill_in "user[name]", with: "Leela"
        fill_in "user[email]", with: "leela@gmail.com"
        fill_in "user[password]", with: "1234"
        fill_in "user[password_confirmation]", with: "1234"

        click_on "Get started!"

        expect(current_path).to eq(roles_path)
        expect(page).to have_content("Welcome to Summoner's Rift #{user.name}!")
      end
    end
  end
end
