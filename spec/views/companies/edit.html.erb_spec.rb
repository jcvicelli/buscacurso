require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :cnpj => "70.274.414/0001-94",
      :name => "MyString",
      :phone => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_cnpj[name=?]", "company[cnpj]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_contact[name=?]", "company[contact]"

    end
  end
end
