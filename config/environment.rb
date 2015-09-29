require 'twitter'
require 'byebug'

API_KEYS = YAML::load(File.open('config/token.yaml'))
#   p "tOKTkyMbIcaHBdmom9bvQWtvI"         == API_KEYS["twitter_consumer_key"]
#   p "3MgO5VtFvSyWRV89sWtwik2Z2xLJ0I4slHcUyjlJrTYwcBGVIe"      == API_KEYS["tiwtter_consumer_secret"]
#   p "3004042005-y6PqLl2A4oY3uv3OTzQ5GBARtUVBZOUS0iH5zyL"         == API_KEYS["twitter_access_token"]
#   p "6zkeyUIo5X0PXhXTsEemQJGoIiQXibkeZev67jp7eCcUm" == API_KEYS["twitter_access_token_secret"]

# byebug
$client = Twitter::REST::Client.new do |config|
  config.consumer_key         = API_KEYS["twitter_consumer_key"]
  config.consumer_secret      = API_KEYS["twitter_consumer_secret"]
  config.access_token         = API_KEYS["twitter_access_token"]
  config.access_token_secret  = API_KEYS["twitter_access_token_secret"]
end