#!/usr/bin/env ruby
require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_OSF_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_OSF_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_OSF_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_OSF_ACCESS_SECRET']
end

search_options = {
  result_type: "recent",
  geocode: "48.8534,2.3488,1000mi"
}

client.search("France", search_options).take(7).each do |tweet|
  #client.favorite(tweet)
  #client.retweet(tweet)
  begin
    puts "#{tweet.user.screen_name}: #{tweet.text}"
    client.favorite(tweet)
    #client.follow(tweet.user)
    #client.retweet(tweet)
  rescue Twitter::Error::Forbidden => e

  end
end