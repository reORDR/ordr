require 'test_helper'

feature 'When a user visits a job they can see when they have interviews scheduled' do
  scenario "viewing a scheduled interview" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Bird Wrangler")
    click_on("Interview")
    page.text.must_include('other')
    page.text.must_include('October 19 2015')
  end

  scenario "updating an interview" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Sweet Jams Architect")
    click_on("Interview")
    page.text.must_include('phone')
    click_on('Edit')
    choose('In-Person Interview')
    click_on("Save")
    page.text.must_include('person')
  end

  scenario "adding an interview from scratch" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    #finish me after we get add jobs working
  end
end
