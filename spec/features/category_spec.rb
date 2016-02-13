require 'rails_helper'

feature "signing in devise" do

  #create saves to db, build dont
  given(:user) { user = FactoryGirl.create(:user)}
  given(:category) { user = FactoryGirl.create(:category)}
  given(:category_type) { user = FactoryGirl.build(:category_type)}

  background do
    sign_in_with user
    visit '/'
  end

  def fill_in_category_fields
    #page.select("Eventos", from: 'category_type_category_id')
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
end
