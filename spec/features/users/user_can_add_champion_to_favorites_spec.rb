require 'rails_helper'

feature 'User can add champion to favorites' do
  context 'as a user' do
    context 'on the champions index page' do
      context 'I can click on the favorite button below a champion' do
        scenario 'it adds a champion to favorites' do
          user = User.create(name: "Leia", email: "leia@email.com", password: "123", password_confirmation: "123")

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          champion = create(:champion, name: "Poppy", damage: "tank")

          visit champions_path
          save_and_open_page
          within("#champion-#{champion.id}") do
            click_on "Favorite"
          end

          expect(page).to have_content("#{champion.name} has been added to your favorites")
        end
      end
    end
  end
end
