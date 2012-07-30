Storenvy Oauth Client
=====================

A starter application for building on the Storenvy OAuth API.

#Getting Started

1. Clone the project folder onto your computer.

2. Register a new application at [http://developers.storenvy.com/oauth/applications](http://developers.storenvy.com/oauth/applications).

        # Callback URL (change the domain, if you're using something else)
        http://storenvy-oauth-client.com/users/auth/storenvy/callback

3. Place your new credentials into `config/storenvy.yml`.

4. Run in the console: `bundle install; rake db:reset`

5. Set [pow](http://pow.cx/) to point `storenvy-oauth-client.dev` to the app's project folder.

6. Build something awesome!