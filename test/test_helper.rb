require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.command_name "MiniTest"

Rails.env ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride" #just for kicks

class ActiveSupport::TestCase
  fixtures :all
end

class ActionController::TestCase
  include Devise::TestHelpers
end

def sign_in(name = :mary)
  visit root_path
  click_link('Log in')
  fill_in 'Email', with: users(mary).email
  fill_in 'Password', with: 'password'
  fill_in 'Password Confirmation', with: 'password'
  click_button('Log in')
end

system 'rubocop'
