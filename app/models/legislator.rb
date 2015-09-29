require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  has_many :tweets, :foreign_key => :twitter_id, :primary_key => :twitter_id
  validates :twitter_id, allow_blank: true, :uniqueness => { message: '%{value} is not a unique Twitter ID' }
end