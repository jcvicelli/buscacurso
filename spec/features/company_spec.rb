require 'rails_helper'

feature "adding company" do

  given(:user) { user = FactoryGirl.create(:user)}
  given!(:user2) { user2 = FactoryGirl.create(:user)}
  given!(:admin) { admin = FactoryGirl.create(:user)}
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
    fill_in "company[email]", with: company.email
  end

  def fill_in_endereco_fields
    fill_in ".cep", with: endereco.cep
    fill_in "company[enderecos_attributes][new_enderecos][cidade]", with: endereco.cidade
    fill_in "company[enderecos_attributes][new_enderecos][logradouro]", with: endereco.logradouro
    fill_in "company[enderecos_attributes][new_enderecos][numero]", with: endereco.numero
    fill_in "company[enderecos_attributes][new_enderecos][estado]", with: endereco.estado
    fill_in "company[enderecos_attributes][new_enderecos][bairro]", with: endereco.bairro
  end

  def add_new_company
    visit '/'
    within(".dropdown") do
        click_link "Parceiros"
    end
    click_link "Novo Parceiro"
    fill_in_company_fields
    click_link "Adicionar Endereço"
    click_button "Salvar"
  end

  scenario "visiting site to add company" do
    add_new_company
    expect(page).to have_content(company.name)
  end

  scenario "another non-admin user can not edit company" do
    add_new_company
    click_link "Log out"
    sign_in_with user2
    visit '/'
    within(".dropdown") do
        click_link "Parceiros"
    end
    click_link company.name
    page.driver.submit :delete, company.id, {}
    expect(page).to have_content("Somente administradores e usuários master podem editar o Parceiro")

  end

  scenario "admin users can edit any company" do
    add_new_company
    click_link "Log out"
    admin.admin = true
    admin.save
    sign_in_with admin
    visit '/'
    within(".dropdown") do
        click_link "Parceiros"
    end
    click_link company.name
    page.driver.submit :delete, company.id, {}
    expect(page).to have_content("Parceiro apagado com sucesso.")

  end

  scenario "add employees to company" do
    add_new_company
    visit '/'

    within(".dropdown") do
        click_link "Parceiros"
    end

    click_link company.name

    fill_in "employee[email]", with: user2.email
    click_button "Adicionar"
    expect(page).to have_content(user2.email)
  end

end
