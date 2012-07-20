module OmniAuth
  module Strategies
    class Storenvy < OmniAuth::Strategies::OAuth2
      option :name, :storenvy
      option :client_options, { site: "http://api.storenvy.dev", authorize_url: "http://www.storenvy.dev/oauth/authorize" }

      uid do
        raw_info["id"]
      end

      info do
        { email: raw_info["email"] }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed["data"]
      end
    end
  end
end
