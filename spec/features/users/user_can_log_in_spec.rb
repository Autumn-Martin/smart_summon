require 'rails_helper'

feature 'User can login' do
  context 'as a user who has already created an account' do
    context 'on the homepage' do
      context 'when I click on log in do' do
        scenario 'I am taken to a login page' do
          user = User.create(name: "Leia", email: "leia@email.com", password: "123")

          visit '/'
          click_on "Challenger"

          # expect(current_path).to eq(login_path)

          fill_in "email", with: user.email
          fill_in "password", with: user.password

          click_on "Log In"

          scenario 'I view the user homepage' do
            expect(page).to have_content("Welcome to Summoner's Rift, #{user.name}")
            expect(page).to have_content("Log out")
          end
        end
      end
    end
  end
end
