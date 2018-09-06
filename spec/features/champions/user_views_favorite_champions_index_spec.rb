require 'rails_helper'

feature 'User views favorite champions' do
  context 'as a logged in user' do
    context 'on the user champions index page' do
      scenario 'views only favorited champions' do

        user = User.create(name: "Leia", email: "leia@email.com", password: "123", password_confirmation: "123")
        champion = create(:champion, name: "Quinn")
        create(:champion, name: "Tahm Kench")
        user.champions << champion

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_champions_path(user)

        expect(page).to have_content(champion.name)
        expect(page).to_not have_content("Tahm Kench")
      end
    end
  end
end
