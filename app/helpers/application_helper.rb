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
    tweets = []
    hash_tags_list.each do |hash_tag|
      client.search(hash_tag).attrs[:statuses].map{ 
        |t| tweets << [t[:text], t[:location]] 
      }
    end
    @tweet_feed = tweets
    # find out which attrs to grab and pull to get the save message updates
  end

  # next save the messages
 
  # def create_message
  #   location?
  #   source: 'twitter'
  #   description
  # 
  # end

  # get the saved messages to display

  def hash_tags_list
    ["chime4justice", "chimeforjustice", "chime4change", "chimeforchange", "Chime4Ed", "pakistan", "ChimeforEd"]
  end
end
