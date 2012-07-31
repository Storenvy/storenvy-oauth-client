class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def storenvy
    oauth_data = request.env["omniauth.auth"]
    @user = User.find_or_initialize_for_storenvy_oauth(oauth_data)
    @user.update_storenvy_credentials(oauth_data)
    @user.save!
    sign_in_and_redirect @user
  end

  def failure
  	Rails.logger.info request.env["omniauth.auth"].inspect
    Rails.logger.info request.env['omniauth.error'].inspect
    Rails.logger.info request.env['omniauth.error.type'].inspect
    Rails.logger.info request.env['omniauth.error.strategy'].inspect
    super
  end
end