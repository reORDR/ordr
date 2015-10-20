require 'test_helper'

feature 'When a user visits their dashboard they can see all their jobs' do
  scenario "users cannot see other users jobs" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include('Cat Wrangler')
    page.text.wont_include('Saxophone Developer')
  end

  scenario "should see all jobs on dashboard" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include('Saxophone Developer')
    page.text.must_include("Sweet Jams Architect")
  end

  scenario "Should be able to view job steps" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    page.text.must_include('Job Steps')
  end

end
