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
    bot_reply = nil
    entries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        if Trip.find_by(sender: sender).nil?
          puts "sender nil"
          trip = Trip.create(sender: sender)
          trip_answer = TripAnswer.create(sender: sender, trip: trip)
        end
        if messaging["read"]
          puts "read"
          # do nothing
        elsif messaging["delivery"]
          puts "delivery"
          #do nothing
        elsif messaging["postback"]
          if messaging["postback"]["payload"] == "Get Started"
            Trip.where(sender: sender).destroy_all
            bot_reply = bot_welcome_reply(sender)
            puts "i've read the bot reply"
            HTTP.post(url, json: bot_reply)
          elsif messaging["postback"]["payload"] == "Let's go!"
            Trip.where(sender: sender).destroy_all
            bot_reply = bot_choices_reply(sender)
            HTTP.post(url, json: bot_reply)
          elsif messaging["postback"]["payload"] == "random"
            go_to_random_suggestion(sender)
          elsif messaging["postback"]["payload"] == "quiz"
            Trip.where(sender: sender).destroy_all
            go_to_first_question(messaging, sender)
          elsif messaging["postback"]["payload"] == "menu"
            Trip.where(sender: sender).destroy_all
            bot_reply = bot_choices_reply(sender)
            HTTP.post(url, json: bot_reply)
          end
        elsif messaging["message"]["attachments"]
          bot_reply = bot_thanks_reply(sender)
          HTTP.post(url, json: bot_reply)
          bot_reply = bot_continue_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["text"] == "Hi"
          puts "i got the hi"
          Trip.where(sender: sender).destroy_all
          puts "i destroyed everything"
          bot_reply = bot_choices_reply(sender)
          puts "i made the reply"
          HTTP.post(url, json: bot_reply)
          puts "i posted the reply"
        elsif messaging["message"]["text"] == "hi"
          puts "i got the hi"
          Trip.where(sender: sender).destroy_all
          bot_reply = bot_choices_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["text"].include? "love"
          bot_reply = bot_love_reply(sender)
          HTTP.post(url, json: bot_reply)
          bot_reply = bot_continue_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["text"].include? "Love"
          bot_reply = bot_love_reply(sender)
          HTTP.post(url, json: bot_reply)
          bot_reply = bot_continue_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["text"].include? "stupid"
          bot_reply = bot_stupid_reply(sender)
          HTTP.post(url, json: bot_reply)
          bot_reply = bot_continue_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["text"].include? "Stupid"
          bot_reply = bot_stupid_reply(sender)
          HTTP.post(url, json: bot_reply)
          bot_reply = bot_continue_reply(sender)
          HTTP.post(url, json: bot_reply)
        elsif messaging["message"]["quick_reply"]
          puts 'I got the quick reply'
          trip_answer = routing_questions(messaging, sender)
          if !trip_answer.city_type_answer.nil?
            escape(messaging, sender, trip_answer)
          end
        elsif messaging["message"]["text"]
          bot_reply = bot_confused_reply(sender)
          HTTP.post(url, json: bot_reply)
        end
      end
      render plain: bot_reply
    end
  end

  def go_to_random_suggestion(sender)
    suggestions = []
    arr_one = City.all.sample(1)
    arr_two = City.all.sample(1)
    arr_three = City.all.sample(1)
    suggestions << arr_one
    suggestions << arr_two
    suggestions << arr_three
    bot_reply = bot_suggestions(sender, suggestions)
    HTTP.post(url, json: bot_reply)
  end

  def go_to_first_question(messaging, sender)
    puts "i'm going to reply"
    bot_reply = bot_first_question(sender)
    HTTP.post(url, json: bot_reply)
  end

  def routing_questions(messaging, sender)
    trip_answer = TripAnswer.find_by(sender: sender)
    if trip_answer.price_answer.nil?
      trip_answer.price_answer = first_user_answer(messaging, sender)
      trip_answer.save
      bot_reply = bot_second_question(sender)
      HTTP.post(url, json: bot_reply)
    elsif trip_answer.location_answer.nil?
      trip_answer.location_answer = second_user_answer(messaging, sender)
      trip_answer.save
      bot_reply = bot_third_question(sender)
      HTTP.post(url, json: bot_reply)
    elsif trip_answer.evening_answer.nil?
      trip_answer.evening_answer = third_user_answer(messaging, sender)
      trip_answer.save
      bot_reply = bot_fourth_question(sender)
      HTTP.post(url, json: bot_reply)
    elsif trip_answer.city_type_answer.nil?
      trip_answer.city_type_answer = fourth_user_answer(messaging, sender)
      trip_answer.save
      bot_reply = bot_about_result_reply(sender)
      HTTP.post(url, json: bot_reply)
    end

    trip_answer
  end

  def first_user_answer(messaging, sender)
    return PriceAnswer.where(payload: messaging["message"]["quick_reply"]["payload"]).first
  end

  def second_user_answer(messaging, sender)
    return LocationAnswer.where(payload: messaging["message"]["quick_reply"]["payload"]).first
  end

  def third_user_answer(messaging, sender)
    return EveningAnswer.where(payload: messaging["message"]["quick_reply"]["payload"]).first
  end

  def fourth_user_answer(messaging, sender)
    return CityTypeAnswer.where(payload: messaging["message"]["quick_reply"]["payload"]).first
  end

  def escape(messaging, sender, trip_answer)
    trip_city = TripCity.create!(trip_answer_id: trip_answer.id)
    trip_city.save
    results = City.where(price_answer_id: trip_city.trip_answer.price_answer_id, location_answer_id: trip_city.trip_answer.location_answer_id, evening_answer_id: trip_city.trip_answer.evening_answer_id, city_type_answer: trip_city.trip_answer.city_type_answer_id)
    bot_reply = bot_results_reply(sender, results)
    HTTP.post(url, json: bot_reply)
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end
end

