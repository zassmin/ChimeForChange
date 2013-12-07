class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

end