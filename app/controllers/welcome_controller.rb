class WelcomeController < ApplicationController
  def profile
    if user_signed_in?
	redirect_to("/messages")
    end
  end
end
