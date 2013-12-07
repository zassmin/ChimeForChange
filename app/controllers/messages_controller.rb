class MessagesController < ApplicationController
  include ApplicationHelper

  def index
    @message = Message.new
    @client = client
    @tweets = fetch_tweets
  end
end