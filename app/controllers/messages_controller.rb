class MessagesController < ApplicationController
  include ApplicationHelper

  def index
    @message = Message.new
    @client = client
  end
end