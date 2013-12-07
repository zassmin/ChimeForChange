class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    message = Message.new(source: 'web',
                          # country: sometime... todo
                          description: params['message']['description'])
    message.populate_tags
    message.save!
    redirect_to root_path
  end

  def show
    @messages = Message.tagged_with(params[:tag])
  end

end