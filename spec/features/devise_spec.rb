require 'rails_helper'

feature "signing in devise" do

  given(:user) { user = FactoryGirl.create(:user)}

  background do
    sign_in_with user
    visit '/'
  end

  scenario "visiting root" do
    visit root_path
    expect(page).to have_content(user.name)
  end

  scenario "editing user" do
    visit root_path
    click_link "Minha Conta"
    fill_in "user[name]", with: FFaker::NameBR.name
    fill_in "user[current_password]", with: user.password
    click_button "Atualizar"
    expect(page).to have_content( "A sua conta foi atualizada com sucesso." )
  end

end
