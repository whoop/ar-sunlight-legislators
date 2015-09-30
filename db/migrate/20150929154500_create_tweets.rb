require_relative '../config'

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |c|
      c.string :tweet_text
      c.datetime :datetime
      c.integer :twitter_id
      c.string :tweet_id
    end
  end
end