storenvy-oauth-client
=====================

A demo application for connecting to the Storenvy OAuth API.

#Getting Started

1. Register an application [http://api.storenvy.dev/oauth/applications](http://api.storenvy.dev/oauth/applications).

        # Callback URL
        http://storenvy-oauth-client.dev/users/auth/storenvy/callback
        
2. Replace your new credentials into constants.rb.

3. Run in the console: `bundle install; rake db:reset`