require 'rails_helper'

feature 'User views all champions with create, update, and destroy buttons' do
  context 'as an admin' do
    context 'when I view the champions index page' do
      scenario 'I also view create, update, and delete buttons for champions' do
        admin = User.create(name: "Hagrid", email: "hagrid@hogwarts.com", password: "dragon")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_champions_path

        expect(page).to have_content("Create")
        expect(page).to have_content("Update")
        expect(page).to have_content("Delete")
      end
    end
  end
  context 'as a default user' do
    context 'when I view the champions index page' do
      scenario 'I do not view create, update, and delete buttons for champions' do
        admin = User.create(name: "Hermione", email: "hermione@hogwarts.com", password: "leviosa")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_champions_path

        expect(page).to have_content("Create")
        expect(page).to have_content("Update")
        expect(page).to have_content(" Delete")
      end
    end
  end
end
