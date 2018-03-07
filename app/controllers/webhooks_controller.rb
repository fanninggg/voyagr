require_relative "../views/webhooks/bot_reply"

class WebhooksController < ApplicationController
  # skip_before_action :authenticate_user!
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
          puts "read"
        elsif messaging["delivery"]
          puts "delivery"
          #do nothing
        elsif messaging["postback"]
          puts "postback"
          sender = messaging["sender"]["id"]
          get_started(messaging, sender)
        elsif messaging["message"]["quick_reply"]
          sender = messaging["sender"]["id"]
          first_question(messaging, sender)
          second_question(messaging, sender)
          third_question(messaging, sender)
          fourth_question(messaging, sender)
          escape(messaging, sender)
        elsif messaging["message"]
          sender = messaging["sender"]["id"]
          text = messaging["message"]["text"]
          if text == "Help"
            my_reply = help_reply(sender)
          else
            my_reply = welcome_reply(sender)
          end
          HTTP.post(url, json: my_reply)
        end
      end
      render plain: my_reply
    end
  end

  def get_started(messaging, sender)
    if messaging["postback"]["payload"] == "Get Started!"
      my_reply = first_question_reply(sender)
      HTTP.post(url, json: my_reply)
    end
  end

  def first_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "£"
      my_reply = second_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"]  == "££"
      my_reply = second_question_reply(sender)
    elsif  messaging["message"]["quick_reply"]["payload"] == "£££"
      my_reply = second_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
  end

  def second_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "europe"
      my_reply = third_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "further"
      my_reply = third_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
  end

  def third_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "bar"
      my_reply = fourth_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "restaurant"
      my_reply = fourth_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "locals"
      my_reply = fourth_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
  end

  def fourth_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "culture"
      my_reply = escape_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "adventure"
      my_reply = escape_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "relax"
      my_reply = escape_reply(sender)
    end
    HTTP.post(url, json: my_reply)
  end

  def escape(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "continue"
      my_reply = results_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "results"
      my_reply = results_reply(sender)
    end
    HTTP.post(url, json: my_reply)
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end
end
