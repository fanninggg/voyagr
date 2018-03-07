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
        sender = messaging["sender"]["id"]
        user = User.where(psid: sender).first
        puts "DEBUG"
        # user ||= User.create(psid: sender)
        puts "DEBUG........"
        trip = Trip.where(user: user).first
        trip ||= Trip.create(user: user)
        if messaging["read"]
          # do nothing
          puts "read"
        elsif messaging["delivery"]
          puts "delivery"
          #do nothing
        elsif messaging["postback"]
          puts "postback"
          trip = get_started(messaging, sender)
        elsif messaging["message"]["quick_reply"]
          routing_questions(messaging, sender, trip)
          escape(messaging, sender)
        elsif messaging["message"]
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
      price_answer_content = 'low'
      my_reply = second_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"]  == "££"
      price_answer_content = 'Medium'
      my_reply = second_question_reply(sender)
    elsif  messaging["message"]["quick_reply"]["payload"] == "£££"
      price_answer_content = 'Expensive'
      my_reply = second_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
    puts "end of first"
    price_answer_content
  end

  def second_question(messaging, sender)
    puts "start of second"
    if messaging["message"]["quick_reply"]["payload"] == "europe"
      location_answer_content = 'Europe'
      my_reply = third_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "further"
      location_answer_content = 'Worldwide'
      my_reply = third_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
    location_answer_content
  end

  def third_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "bar"
      evening_answer_content = 'Bar'
      my_reply = fourth_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "restaurant"
      evening_answer_content = 'Restaurant'
      my_reply = fourth_question_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "locals"
      evening_answer_content = 'Meet the locals'
      my_reply = fourth_question_reply(sender)
    end
    HTTP.post(url, json: my_reply)
    evening_answer_content
  end

  def fourth_question(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "culture"
      type_answer_content =  'Culturous'
      my_reply = escape_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "adventure"
      type_answer_content =  'Adventurous'
      my_reply = escape_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "relax"
      type_answer_content =  'Relaxing'
      my_reply = escape_reply(sender)
    end
    HTTP.post(url, json: my_reply)
    type_answer_content
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

  def routing_questions(messaging, sender, trip)
    puts "in the method"
    price_answer_content = first_question(messaging, sender)
    puts price_answer_content
    if price_answer_content
      puts "i am here mother"
      location_answer_content = second_question(messaging, sender)
      if location_answer_content
        evening_answer_content = third_question(messaging, sender)
        if evening_answer_content
          type_answer_content = fourth_question(messaging, sender)
          if city_type_answer
            trip_answer = TripAnswer.create!(price_answer: PriceAnswer.where(content: price_answer_content).first,
                                             location_answer: LocationAnswer.where(content: location_answer_content).first,
                                             evening_answer: EveningAnswer.where(content: evening_answer_content).first,
                                             city_type_answer: CityTypeAnswer.where(content: type_answer_content).first,
                                             trip: trip)
          end
        end
      end
    end
  end
  end
end
