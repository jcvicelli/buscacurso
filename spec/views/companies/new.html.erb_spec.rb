require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :cnpj => "70.274.414/0001-94",
      :name => "MyString",
      :phone => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_cnpj[name=?]", "company[cnpj]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_contact[name=?]", "company[contact]"

    end
  end
end
