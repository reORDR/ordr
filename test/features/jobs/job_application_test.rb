require 'test_helper'

feature 'When a user visits a job they can see when they applied' do
  scenario "marking a job applied" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    click_on("Apply")
    page.text.must_include('Sent')
  end

  scenario "should see all jobs on dashboard" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include('Saxophone Developer')
    page.text.must_include("Sweet Jams Developer")
  end

  scenario "Should be able to view job steps" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    page.text.must_include('Job Steps')
  end

  scenario "Should be able to view job details" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    page.text.must_include('Job Steps')
    click_on ('Job Details')
    page.text.must_include('Apply by')
  end
end
