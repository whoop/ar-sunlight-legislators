require_relative '../../db/config'

class Tweet
  belongs_to :legislators, :foreign_key => :twitter_id
end
