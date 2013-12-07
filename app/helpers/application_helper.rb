module ApplicationHelper

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end
  
  def fetch_tweets
    # makes this case sensitive, if I need t
    # hash_tag = hash_tag.match(/^#(.*)/)[1]
    # figure out country hash tag things
    tweets = []
    hash_tags_list.each do |hash_tag|
      tweets << client.search(hash_tag)
    end
    @tweet_feed = tweets
    # only grab the most recent
    # figure out with attrs to grab
  end

  # def create_message
  #   location?
  #   source: 'twitter'
  #   description
  # 
  # end

  def hash_tags_list
    ["chime4justice", "chimeforjustice", "chime4change", "chimeforchange", "Chime4Ed", "pakistan", "ChimeforEd"]
  end
end
