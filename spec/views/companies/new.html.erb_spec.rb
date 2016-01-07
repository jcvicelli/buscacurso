require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :cnpj => "MyString",
      :name => "MyString",
      :phone => "MyString",
      :contact => "MyString",
      :user => nil
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_cnpj[name=?]", "company[cnpj]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_contact[name=?]", "company[contact]"

      assert_select "input#company_user_id[name=?]", "company[user_id]"
    end
  end
end
