class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to url_for({controller: 'jobs', action: 'index'})
    else
      redirect_to root_path
    end
  end
end
