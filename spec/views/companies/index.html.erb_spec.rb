require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :cnpj => "70.274.414/0001-94",
        :name => "Name",
        :phone => "Phone",
        :contact => "Contact"
      ),
      Company.create!(
        :cnpj => "70.274.414/0001-94",
        :name => "Name",
        :phone => "Phone",
        :contact => "Contact"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
  end
end
