require 'rails_helper'

feature "visiting static pages" do

  scenario "visiting be_company" do
    visit root_path
    click_link "Seja um Parceiro"
    expect(page).to have_content( "Seja um Parceiro" )
    find_link('Cadastre-se').visible?
  end

  scenario "visiting about" do
    visit root_path
    click_link "Quem somos"
    expect(page).to have_content( "Quem somos" )
  end

  scenario "visiting contact" do
    visit root_path
    click_link "Contato"
    expect(page).to have_content( "Contato" )
  end
end
