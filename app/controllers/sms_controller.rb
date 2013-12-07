class SmsController < ApplicationController

  def receive
    message_body = params['Body']
    from_number = params['From']

    puts from_number, message_body
    render xml: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Response>
    <Message>Hey Monkey. Thanks for the message!</Message>
</Response>"
  end

end