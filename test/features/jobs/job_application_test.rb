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
    page.text.wont_include('Not sent')
  end

  scenario "marking a job applied" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Saxophone Developer")
    click_on("Apply")
    page.text.must_include('Not sent')
    click_on('Edit')
    check('job_application_sent')
    click_on("Save")
    page.text.must_include('Sent')
    page.text.wont_include('Not sent')
  end


end
