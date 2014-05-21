class ArticlesController < ApplicationController

  before_action :authenticate_user!

  def index
    client = OAuth2::Client.new(
        ENV['DOORKEEPER_APP_ID'],
        ENV['DOORKEEPER_APP_SECRET'],
        site: ENV['DOORKEEPER_APP_URL'])

    if current_user && current_user.doorkeeper_oauth
      access_token = OAuth2::AccessToken.new(client, current_user.doorkeeper_oauth.token)
      response = access_token.get('api/v1/articles.json')
      render json: response.parsed
    end
  end
end
