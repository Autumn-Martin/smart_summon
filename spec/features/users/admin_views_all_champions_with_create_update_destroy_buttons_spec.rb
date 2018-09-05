require 'rails_helper'

feature 'User views all champions with create, update, and destroy buttons' do
  context 'as an admin' do
      context 'user visits admin champions index page' do
        scenario 'displays all champions' do
          champion_1 = create(:champion, name: "Poppy", damage: "tank")
          champion_2 = create(:champion, name: "Heimerdinger", damage: "magic")
          admin = User.create(name: "Hagrid", email: "hagrid@hogwarts.com", password: "dragon", role: 1)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

          visit admin_champions_path

          expect(page).to have_content(champion_1.name)
          expect(page).to have_content(champion_1.damage)
          expect(page).to have_content(champion_2.name)
          expect(page).to have_content(champion_2.damage)
        end
      end

    context 'when I view the admin champions index page' do
      scenario 'I also view create, update, and delete buttons for champions' do
        admin = User.create(name: "Hagrid", email: "hagrid@hogwarts.com", password: "dragon", role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_champions_path

        expect(page).to have_link("Create")
        expect(page).to have_link("Update")
        expect(page).to have_link("Delete")
      end
    end
  end

  context 'as a default user' do
    context 'when I view the admin champions index page' do
      scenario 'I view a 404 not found page instead' do
        champion_1 = create(:champion, name: "Poppy", damage: "tank")
        champion_2 = create(:champion, name: "Heimerdinger", damage: "magic")
        user = User.create(name: "Hermione", email: "hermione@hogwarts.com", password: "leviosa", role: 0)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit admin_champions_path
        
        expect(page).to have_content("The page you were looking for doesn't exist")
        expect(page).to_not have_link("Create")
        expect(page).to_not have_link("Update")
        expect(page).to_not have_link("Delete")
        expect(page).to_not have_content(champion_1.name)
        expect(page).to_not have_content(champion_1.damage)
        expect(page).to_not have_content(champion_2.name)
        expect(page).to_not have_content(champion_2.damage)
      end
    end
  end

end
