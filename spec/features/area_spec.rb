require 'rails_helper'

feature "adding area" do

  #create saves to db, build dont
  given(:user) { user = FactoryGirl.create(:user)}
  given(:area) { area = FactoryGirl.build(:area)}

  background do
    user.admin = true
    user.save
    sign_in_with user
    visit '/'
  end

  def fill_in_area_fields
    fill_in "area[name]", with: area.name
  end

  scenario "visiting site to add area" do
    visit '/'
    within(".dropdown") do
        click_link "Areas"
    end
    click_link "Nova Area"
    fill_in_area_fields
    click_button "Salvar"
    expect(page).to have_content(area.name)
  end

  scenario "visiting site to edit area" do
    area = FactoryGirl.create(:area)
    visit '/'
    within(".dropdown") do
        click_link "Areas"
    end
    expect(page).to have_content(area.name)
    click_link area.name
    click_link "Editar"
    area.name = "History"
    fill_in "area[name]", with: area.name
    click_button "Salvar"
    expect(page).to have_content(area.name)
  end
end
