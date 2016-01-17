require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :title => "Title",
        :description => "MyText",
        :about => "MyText",
        :place => "Place",
        :company => nil,
        :rating => "Rating"
      ),
      Course.create!(
        :title => "Title",
        :description => "MyText",
        :about => "MyText",
        :place => "Place",
        :company => nil,
        :rating => "Rating"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Place".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Rating".to_s, :count => 2
  end
end
