require 'rails_helper'

feature "signing in" do

  let(:user) {FactoryGirl.create (:user) }

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"
  end

  scenario "visiting site to sign in" do
    user.confirmed_at = Time.now
    user.save
    visit root_path
    click_link "Log in"
    fill_in_signin_fields
    expect(page).to have_content("Login efetuado com sucesso.")
  end
end
