require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :title => "MyString",
      :description => "MyText",
      :about => "MyText",
      :place => "MyString",
      :company => nil,
      :rating => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input#course_title[name=?]", "course[title]"

      assert_select "textarea#course_description[name=?]", "course[description]"

      assert_select "textarea#course_about[name=?]", "course[about]"

      assert_select "input#course_place[name=?]", "course[place]"

      assert_select "input#course_company_id[name=?]", "course[company_id]"

      assert_select "input#course_rating[name=?]", "course[rating]"
    end
  end
end
