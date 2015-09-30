require 'twitter'

API_KEYS = YAML::load(File.open('config/token.yaml'))

$client = Twitter::REST::Client.new do |config|
  config.consumer_key         = API_KEYS["twitter_consumer_key"]
  config.consumer_secret      = API_KEYS["twitter_consumer_secret"]
  config.access_token         = API_KEYS["twitter_access_token"]
  config.access_token_secret  = API_KEYS["twitter_access_token_secret"]
end