class SessionsController < ApplicationController
  def new
    @facebook_modal_login_url = "https://www.facebook.com/v10.0/dialog/oauth?client_id=#{ENV["app_id"]}&redirect_uri=#{home_url}&scope=public_profile,email"
  end
end
