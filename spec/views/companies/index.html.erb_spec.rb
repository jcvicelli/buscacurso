require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :cnpj => "Cnpj",
        :name => "Name",
        :phone => "Phone",
        :contact => "Contact",
        :user => nil
      ),
      Company.create!(
        :cnpj => "Cnpj",
        :name => "Name",
        :phone => "Phone",
        :contact => "Contact",
        :user => nil
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
