# require 'rails_helper'
#
# feature 'User views show page' do
#   context 'user links from roles' do
#     scenario 'displays all favorited champions for that role' do
#       role = create(:role)
#
#       user = User.create(name: "Leia", email: "leia@email.com", password: "123", password_confirmation: "123")
#
#       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#       champion_1 = create(:champion, name: "Poppy", damage: "tank")
#       champion_2 = create(:champion, name: "Heimerdinger", damage: "magic")
#
#       role.champions << champion_1
#       role.champions << champion_2
#
#       user.champions << champion_1
#
#       visit user_role_champions_path(role)
#
#       expect(current_path).to eq(user_role_champions_path(role))
#       expect(page).to have_content(champion_1.name)
#       expect(page).to have_content(champion_1.damage)
#       expect(page).to_not have_content(champion_2.name)
#       expect(page).to_not have_content(champion_2.damage)
#     end
#   end
# end
