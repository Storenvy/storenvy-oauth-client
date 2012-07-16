storenvy-oauth-client
=====================

A demo application for connecting to the Storenvy OAuth API

#Getting Started

1. Register an application [http://www.storenvy.dev/oauth/applications](http://www.storenvy.dev/oauth/applications)

        # Callback URL
        http://storenvy-oauth-client.dev/auth/todo/callback
        
2. From the console, generate a redirect URL with these steps:
        
        callback = "http://storenvy-oauth-client.dev/auth/todo/callback" # url from this app
        app_id   = "#{your_api_key}"
        secret   = "#{your_api_key}"
        client   = OAuth2::Client.new(app_id, secret, site: "http://api.storenvy.dev")
        url      = client.auth_code.authorize_url(redirect_uri: callback)
        
3. Redirect to the url on Storenvy.
4. The user will log into his/her Storenvy account or sign up.
5. The user confirms the authorization.
6. The user is redirected back to your callback url with a code in the url.
        
        # example
        http://storenvy-oauth-client.dev/auth/todo/callback?code=123456789012345678901234567890
7. Generate an access token with the code from the url
        
        client   = OAuth2::Client.new(app_id, secret, site: "http://api.storenvy.dev")
        callback = "http://storenvy-oauth-client.dev/auth/todo/callback"
        access   = client.auth_code.get_token("#{your_code}", redirect_uri: callback)
8. Test that the token works.
        
        puts access.get("/v1/products").parsed