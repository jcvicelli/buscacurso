require 'rails_helper'

feature "adding area" do

  #create saves to db, build dont
  given(:user) { user = FactoryGirl.create(:user)}
  given(:area) { area = FactoryGirl.build(:area)}

  background do
    sign_in_with user
    visit '/'
  end

  def fill_in_area_fields
    fill_in "area[name]", with: area.name
  end

  scenario "visiting site to add area" do
    visit '/'
    within(".dropdown") do
        click_link "Area"
    end
    click_link "Nova Area"
    fill_in_area_fields
    click_button "Salvar"
    expect(page).to have_content(area.name)
  end

  scenario "visiting site to edit category" do
    category_type = FactoryGirl.create(:category_type)
    visit '/'
    within(".dropdown") do
        click_link "Categorias"
    end
    expect(page).to have_content(category_type.name)
    click_link category_type.name
    click_link "Editar"
    category_type.name = "Mestrado"
    fill_in "category_type[name]", with: category_type.name
    click_button "Salvar"
    expect(page).to have_content(category_type.name)
  end
end
