require 'rails_helper'

feature "adding courses" do

  given!(:user) { user = FactoryGirl.create(:user)}
  given(:course) { course = FactoryGirl.build(:course) }
  given!(:company) { company = FactoryGirl.create(:company)}

  background do
    course.reindex
    Course.searchkick_index.refresh
    sign_in_with user
    visit '/'

  end

  def fill_in_course_fields
    fill_in "course[title]", with: course.title
    fill_in "course[description]", with: course.description
    page.select(company.name, from: 'course_company_id')
  end

  scenario "visiting site to add course" do
    visit '/'
    within(".dropdown") do
        click_link "Cursos | Eventos"
    end
    click_link "Novo Curso"
    fill_in_course_fields
    click_button "Salvar"
    expect(page).to have_content(course.title)
  end

  scenario "visiting site to add course shouldnt be empty" do
    visit '/'
    within(".dropdown") do
        click_link "Cursos | Eventos"
    end
    click_link "Novo Curso"
    click_button "Salvar"
    expect(page).to have_content("não pode ficar em branco")
  end

end
