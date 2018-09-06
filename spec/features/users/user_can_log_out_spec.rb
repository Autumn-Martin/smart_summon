require 'rails_helper'

feature 'User can log out' do
  context 'as a user who has already created an account' do
    context 'after I have logged in' do
      context 'on the navigation bar' do
        context 'I click log out' do
          scenario 'it logs me out' do
            user = User.create(name: "Leia", email: "leia@email.com", password: "123")

            visit '/'
            click_on "Challenger"

            expect(current_path).to eq(login_path)
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password

            click_on "Log In"

            expect(current_path).to eq(roles_path)
            expect(page).to have_content("Log out")

            click_on "Log out"
            expect(page).to have_content("Logged out!")
          end
        end
      end
    end
  end
end
