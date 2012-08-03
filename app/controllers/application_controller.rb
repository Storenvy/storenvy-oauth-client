class ApplicationController < ActionController::Base
  protect_from_forgery

  def storenvy_oauth_client
    Rails.logger.debug "\n\n #{STORENVY_OAUTH.inspect} \n\n"
    @client ||= OAuth2::Client.new(STORENVY_OAUTH[:app_id], STORENVY_OAUTH[:secret], :site => 'https://api.storenvy.com')
  end

  def storenvy_access_token
    @token ||= OAuth2::AccessToken.new(storenvy_oauth_client, current_user.storenvy_access_token) if current_user
  end
  
  private
  
  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: "http://localhost:3000")
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end
end
