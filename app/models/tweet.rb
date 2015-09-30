require_relative '../../db/config'

class Tweet < ActiveRecord::Base
  belongs_to :legislators, :foreign_key => :twitter_id
  validates_uniqueness_of :tweet_id
end
