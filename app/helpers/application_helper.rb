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
  end

  def create_messages
    fetch_tweets.each do |tweet|
      next if Message.find_by_description(tweet[0])
      message = Message.new(source: 'twitter',
                            # country: sometime... todo
                            description: tweet[0])
      message.populate_tags #unless message.populate_tags.blank?
     # message.tag_list = "#chimeforchange"
      message.save
    end
  end

  def hash_tags_list
    ["chime4justice", "chimeforjustice", "chime4change", "chimeforchange", "Chime4Ed", "ChimeforEd", "chimeforchange"]
  end
end
