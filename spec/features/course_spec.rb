require 'rails_helper'

feature "signing in devise" do

  given(:user) { user = FactoryGirl.create(:user)}
  given(:course) { user = FactoryGirl.build(:course)}
  given(:company) { user = FactoryGirl.build(:company)}

  background do
    sign_in_with user
    visit '/'
  end

  def fill_in_course_fields
    fill_in "course[title]", with: course.title
    fill_in "course[description]", with: course.description
    fill_in "course[place]", with: course.place
  end

  scenario "visiting site to add course" do
    visit '/'
    within(".dropdown") do
        click_link "Cursos"
    end
    click_link "Novo Curso"
    fill_in_course_fields
    click_button "Salvar"
    expect(page).to have_content(course.title)
  end
end
