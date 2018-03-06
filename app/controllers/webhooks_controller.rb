require_relative "../views/webhooks/bot_reply"

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
          puts "hi"
        elsif messaging["delivery"]
          puts "ho"
          #do nothing
        elsif messaging["postback"]
          puts "hey"
          # Error check
          if messaging["postback"]["payload"] == "We are Voyagr!"
            # sender = messaging["sender"]["id"]
            # my_reply = get_started_reply(sender)
          end
        elsif messaging["message"]
          sender = messaging["sender"]["id"]
          text = messaging["message"]["text"]
          if text == "Help"
            puts "holla"
          else
            puts "salut"
            my_reply = welcome_reply(sender)
          end
          HTTP.post(url, json: my_reply)
          puts my_reply
        end
      end
      render plain: my_reply
    end
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end
end
