require 'rails_helper'

feature "signing in devise" do

  given(:user) { user = FactoryGirl.create(:user)}
  given(:company) { user = FactoryGirl.build(:company)}
  given(:endereco) { user = FactoryGirl.build(:endereco)}

  def fill_in_signin_fields
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Log in"
  end

  def fill_in_company_fields
    fill_in "company[cnpj]", with: company.cnpj
    fill_in "company[name]", with: company.name
    fill_in "company[phone]", with: company.phone
    fill_in "company[contact]", with: company.contact
  end

  def fill_in_endereco_fields
    fill_in "company[enderecos_attributes][0][cep]", with: endereco.cep
    fill_in "company[enderecos_attributes][0][cidade]", with: endereco.cidade
    fill_in "company[enderecos_attributes][0][logradouro]", with: endereco.logradouro
    fill_in "company[enderecos_attributes][0][numero]", with: endereco.numero
    fill_in "company[enderecos_attributes][0][estado]", with: endereco.estado
    fill_in "company[enderecos_attributes][0][bairro]", with: endereco.bairro
  end

  def login_user
    user.confirmed_at = Time.now
    user.save
    visit root_path
    click_link "Log in"
    fill_in_signin_fields
  end

  scenario "visiting site to add company" do
    login_user
    expect(page).to have_content(user.name)
    click_link "Empresas"
    click_link "Nova Empresa"
    fill_in_company_fields
    fill_in_endereco_fields
    click_button "Salvar"
    expect(page).to have_content(company.name)
  end
end
