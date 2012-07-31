module OmniAuth
  module Strategies
    class Storenvy < OmniAuth::Strategies::OAuth2
      option :name, :storenvy

      option :client_options, {
        site:          (STORENVY_OAUTH[:site] || "http://api.storenvy.com"),
        authorize_url: (STORENVY_OAUTH[:authorize_url] || "http://www.storenvy.com/oauth/authorize"),
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"],
          login: raw_info["login"],
          bio: raw_info["bio"],
          location: raw_info["location"],
          gender: raw_info["gender"],
          twitter: raw_info["twitter"],
          facebook: raw_info["facebook"],
          birthday: raw_info["birthday"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed["data"]
      end
    end
  end
end
