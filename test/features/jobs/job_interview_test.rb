require 'test_helper'

feature 'When a user visits a job they can see when they have interviews scheduled' do
  scenario "viewing a scheduled interview" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Bird Wrangler")
    click_on("Interview")
    page.text.must_include('Scheduled')
    page.text.must_include('phone')
    page.text.wont_include('Not scheduled')
  end

  scenario "marking a job applied" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Sweet Jams Architect")
    click_on("Interview")
    page.text.must_include('phone')
    click_on('Edit')
    click_on('new_job_interview')
    fill_in 'format', with: 'technical'
    fill_in 'date', with: Time.now
    click_on("Save")
    page.text.must_include('technical')
  end
end
