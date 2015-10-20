require "test_helper"

feature "Mock Linkedin Authentication" do
  before do
    visit root_path
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({provider: 'linkedin', uid: '12345'})
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    OmniAuth.config.add_mock(:linkedin,{uid: '12345',info: { name: 'linkedin_user'},})
  end
  scenario "sign in with Linkedin" do
    skip
    #FIXME test passes, but omniauth currently not working
    visit root_path
    click_link "Sign in with linkedin"
    visit root_path
   end
end
