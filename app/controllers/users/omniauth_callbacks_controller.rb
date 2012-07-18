class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def storenvy
    oauth_data = request.env["omniauth.auth"]
    @user = User.find_or_initialize_for_storenvy_oauth(oauth_data)
    @user.update_storenvy_credentials(oauth_data)
    @user.save!

    sign_in_and_redirect @user
  end
  
  def failure
    Rails.logger.debug("Failure reason: #{request.env['omniauth.error'].response.inspect}")
    super
  end
end
