class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to url_for({controller: 'jobs', action: 'index'})
    else
      redirect_to new_user_session_path
    end
  end
end
