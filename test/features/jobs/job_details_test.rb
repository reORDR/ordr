require 'test_helper'

feature 'User can view and edit job details' do
  scenario "users can update job details" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include('Cat Wrangler')
    click_on('Cat Wrangler')
    click_on('Job Details')
    click_on('Edit')
    fill_in 'job_title', with: 'Web Dev'
    click_on('Save')
    page.text.must_include('Job was successfully updated.')
    page.text.must_include('Web Dev')
  end

  scenario "can add a note to a job detail" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include('Saxophone Developer')
    click_on('Add Note')
    fill_in 'content', with: "I really want this job"
    click_button('Save')
    page.text.must_include('Note was successfully added.')
    page.text.must_include('I really want this job')
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
