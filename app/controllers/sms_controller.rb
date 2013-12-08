class SmsController < ApplicationController

  def receive
    body = params['Body']
    if body.include? 'SEND'
      tag = body.scan(/#[a-zA-Z0-9]+/).first
      render xml: response_message(Message.tagged_with(tag).by_send_date.limit(5).join("\n"))
      return
    end

    message = Message.new(country: params['FromCountry'],
                          source: 'sms',                # todo standardize source?
                          description: body)
    tag_list = message.populate_tags
    if message.save
      render xml: response_message("Saved, the tags #{tag_list}!\nReply with SEND and a tag to see 5 newest messages.")
    else
      render xml: response_message('Please include at least one tag in your message, like #chime4change')
    end
  end

  private
  def response_message(msg)
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Response>
    <Message>#{msg}</Message>
</Response>"
  end

end

# sample params
#{"AccountSid"=>"AC8f02701ed57893c9785aa56183fcfb0c",
# "MessageSid"=>"SMafb0de1778bf9992430f925c6927fd17",
# "Body"=>"One more",
# "ToZip"=>"94015", "ToCity"=>"SAN FRANCISCO", "FromState"=>"CA", "ToState"=>"CA",
# "SmsSid"=>"SMafb0de1778bf9992430f925c6927fd17",
# "To"=>"+16507310455", "ToCountry"=>"US", "FromCountry"=>"US",
# "SmsMessageSid"=>"SMafb0de1778bf9992430f925c6927fd17",
# "ApiVersion"=>"2010-04-01",
# "FromCity"=>"SAN FRANCISCO", "SmsStatus"=>"received",
# "NumMedia"=>"0", "From"=>"+14154042408", "FromZip"=>"94014"}