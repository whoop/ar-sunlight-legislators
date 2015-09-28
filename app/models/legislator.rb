require_relative '../../db/config'

class Legislator < ActiveRecord::Base
  validates :twitter_id, allow_blank: true, :uniqueness => { message: '%{value} is not a unique Twitter ID' }
end