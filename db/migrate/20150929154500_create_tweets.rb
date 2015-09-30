require_relative '../config'

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |c|
      c.string :tweet_text
      c.datetime :datetime
      c.integer :twitter_id
      c.integer :tweet_id, limit: 4
    end
  end
end