require 'test_helper'

feature 'Can view and edit job research' do
  scenario "viewing job research" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    click_on("Research")
    page.text.must_include('Some text')
    click_on("Edit")
    find('#research_company_mission').set("Do good and change the world")
    click_on("Save")
    page.text.must_include("Do good and change the world")
    find('#research_company_goals').set("Do better and change the world")
    click_on("Save")
    page.text.must_include("Do better and change the world")
    find('#research_current_projects').set("Do the best and change the world")
    click_on("Save")
    page.text.must_include("Do the best and change the world")
  end
end
