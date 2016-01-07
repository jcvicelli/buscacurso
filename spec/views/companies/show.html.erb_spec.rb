require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :cnpj => "Cnpj",
      :name => "Name",
      :phone => "Phone",
      :contact => "Contact",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Cnpj/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(//)
  end
end
