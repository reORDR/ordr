require "test_helper"

feature "Authentication::CanLogOut" do
  scenario "with a logged in user" do
    visit root_path
    fill_in 'user_email', with: users(:scott).email
    fill_in 'user_password', with: 'password'
    click_button('Log in')
    page.text.must_include "Signed in successfully."
    click_link('Sign out')
    page.text.must_include "Sign in"
  end
end
