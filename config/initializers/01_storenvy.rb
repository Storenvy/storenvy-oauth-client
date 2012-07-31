STORENVY_OAUTH = YAML.load_file("#{Rails.root}/config/storenvy.yml")[Rails.env]
STORENVY_OAUTH.symbolize_keys!