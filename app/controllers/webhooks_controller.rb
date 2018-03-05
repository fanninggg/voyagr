class WebhooksController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def messenger
    if params["hub.verify_token"] == ENV['MESSENGER_VERIFICATION_TOKEN']
      render plain: params["hub.challenge"]
    else
      render plain: "error"
    end
  end

  def receive_message
    puts "asdf"
    therequest = request.body.read
    data = JSON.parse(therequest)
    entries = data["entry"]
    sender = nil
    text = nil
    my_reply = nil
    entries.each do |entry|
      entry["messaging"].each do |messaging|
        if messaging["read"]
          # do nothing
        elsif messaging["delivery"]
          #do nothing
        elsif messaging["postback"]
          # Error check
          if messaging["postback"]["payload"] == "We are Voyagr!"
            # sender = messaging["sender"]["id"]
            # my_reply = get_started_reply(sender)
          end
        elsif messaging["message"]
          # sender = messaging["sender"]["id"]
          # text = messaging["message"]["text"]
          if text == "help"
            puts "holla"
          else
            puts "salut"
          end
          HTTP.post(url, json: my_reply)
        end
      end
      puts my_reply
      render plain: my_reply
    end
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end
end
