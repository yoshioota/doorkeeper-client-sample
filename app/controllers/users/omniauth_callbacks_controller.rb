module Users

  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def doorkeeper
      raise if current_user.nil?

      oauth_data = request.env['omniauth.auth']
      user = current_user.update_oauth(oauth_data)

      sign_in_and_redirect user
    end
  end
end
