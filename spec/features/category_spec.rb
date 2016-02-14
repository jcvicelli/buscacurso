require 'rails_helper'

feature "adding category" do

  #create saves to db, build dont
  given(:user) { user = FactoryGirl.create(:user)}
  given(:category_type) { category_type = FactoryGirl.build(:category_type)}
  given!(:category) { category = FactoryGirl.create(:category)}

  background do
    sign_in_with user
    visit '/'
  end

  def fill_in_category_fields
    page.select(category.name, from: 'category_type_category_id')
    fill_in "category_type[name]", with: category_type.name
  end

  scenario "visiting site to add category" do
    visit '/'
    within(".dropdown") do
        click_link "Categorias"
    end
    click_link "Nova Categoria"
    fill_in_category_fields
    click_button "Salvar"
    expect(page).to have_content(category_type.name)
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
