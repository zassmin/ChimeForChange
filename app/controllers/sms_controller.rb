class SmsController < ApplicationController

  def receive
    message_body = params['Body']
    from_number = params['From']

    message = Message.new
    message.country = params['FromCountry']
    message.source = 'sms' # todo standardize this somehow
    message.description = params['Body']
    message.tag_list = message.description.scan(/#[a-zA-Z0-9]+/).join(', ')
    message.save! unless message.tag_list.empty?

    puts message.to_s
    if message.tag_list.empty?
      render xml: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Response>
    <Message>Uh oh, no tags!  Nothing saved!</Message>
</Response>"
    else
    render xml: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Response>
    <Message>Saved, with the tags #{message.tag_list}</Message>
</Response>"
    end
  end

end

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