require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :cnpj => "MyString",
      :name => "MyString",
      :phone => "MyString",
      :contact => "MyString",
      :user => nil
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input#company_cnpj[name=?]", "company[cnpj]"

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_phone[name=?]", "company[phone]"

      assert_select "input#company_contact[name=?]", "company[contact]"

      assert_select "input#company_user_id[name=?]", "company[user_id]"
    end
  end
end
