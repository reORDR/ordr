require 'test_helper'

feature 'Can schedule networking opportunities' do
  scenario "adding a network opportunity" do
    visit root_path
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Cat Wrangler")
    click_on("Networking")
    page.text.must_include('Did / do you plan to discuss this position with someone?')
    page.text.must_include('No')
    click_on("Edit")
    find("#network_plans_true").click
    click_on("Save")
    page.text.must_include('Yes')
  end

  scenario "updating a networking oppt" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: "password"
    click_button('Log in')
    click_on("Saxophone Developer")
    click_on("Networking")
    page.text.must_include('Yes')
    page.text.must_include('2015-10-19')
  end

end
