require 'rails_helper'

feature "signing in devise" do

  given(:user) { user = FactoryGirl.create(:user)}
  given(:company) { user = FactoryGirl.build(:company)}
  given(:endereco) { user = FactoryGirl.build(:endereco)}

  background do
    sign_in_with user
    visit '/'
  end

  def fill_in_company_fields
    fill_in "company[cnpj]", with: company.cnpj
    fill_in "company[name]", with: company.name
    fill_in "company[phone]", with: company.phone
    fill_in "company[contact]", with: company.contact
  end

  def fill_in_endereco_fields
    fill_in ".cep", with: endereco.cep
    fill_in "company[enderecos_attributes][new_enderecos][cidade]", with: endereco.cidade
    fill_in "company[enderecos_attributes][new_enderecos][logradouro]", with: endereco.logradouro
    fill_in "company[enderecos_attributes][new_enderecos][numero]", with: endereco.numero
    fill_in "company[enderecos_attributes][new_enderecos][estado]", with: endereco.estado
    fill_in "company[enderecos_attributes][new_enderecos][bairro]", with: endereco.bairro
  end

  scenario "visiting site to add company" do
    visit '/'
    within(".dropdown") do
        click_link "Empresas"
    end
    click_link "Nova Empresa"
    fill_in_company_fields
    click_link "Adicionar Endereço"
    click_button "Salvar"
    expect(page).to have_content(company.name)
  end
end
