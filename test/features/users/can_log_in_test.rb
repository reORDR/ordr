require "test_helper"

feature "Authentication::CanLogin" do
  before :each do
    visit root_path
  end

  scenario "with a valid login" do
    fill_in 'user_email', with: users(:mary).email
    fill_in 'user_password', with: 'password'
    click_button('Log in')
    page.text.must_include "Signed in successfully."
  end

  scenario "without valid user email" do
    fill_in 'user_email', with: "notauser@example.com"
    fill_in 'user_password', with: "password"
    click_button('Log in')
    page.text.must_include "Invalid email or password."
  end

  scenario "with a valid email but not a valid password" do
    fill_in 'Email', with: users(:garrett).email
    fill_in 'Password', with: "wrongpassword"
    click_button('Log in')
    page.text.must_include "Invalid email or password."
  end
end
