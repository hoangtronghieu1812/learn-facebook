class HomesController < ApplicationController
  require 'net/http'

  def show
    access_token = get_access_token(params[:code]).try :[], "access_token"
    @user = get_api_request "me", "name,email", access_token
  end

  private

  def get_access_token code
    uri = URI "https://graph.facebook.com/v10.0/oauth/access_token?client_id=#{ENV["app_id"]}&redirect_uri=#{home_url}&client_secret=#{ENV["app_secret"]}&code=#{code}"
    response_body = JSON.parse Net::HTTP.get_response(uri).body
  end

  def get_api_request endpoint, fields, access_token
    uri = URI "https://graph.facebook.com/v10.0/#{endpoint}?access_token=#{access_token}&fields=#{fields}"
    response_body = JSON.parse Net::HTTP.get_response(uri).body
  end
end
