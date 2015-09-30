require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |c|
      c.string :title
      c.string :firstname
      c.string :middlename, default: nil
      c.string :lastname
      c.string :name_suffix, default: nil
      # c.string :nickname
      c.string :party
      c.string :state
      # c.string :district
      c.integer :in_office
      c.string :gender
      c.string :phone
      c.string :fax
      c.string :website, default: nil
      c.string :webform, default: nil
      # c.string :congress_office
      # c.string :bioguide_id
      # c.integer :votesmart_id
      # c.string :fec_id
      # c.integer :govtrack_id
      # c.string :crp_id
      c.string :twitter_id, default: nil
      # c.string :congresspedia_url
      # c.string :youtube_url
      # c.string :facebook_id
      # c.string :official_rss
      # c.string :senate_class
      c.date :birthdate
    end
  end
end