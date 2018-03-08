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
        if messaging["read"]
          # do nothing
        elsif messaging["delivery"]
          #do nothing
        elsif messaging["postback"]
          if messaging["postback"]["payload"] == "Get Started!"
            go_to_first_question(messaging, sender)
          end
        elsif messaging["message"]["quick_reply"]
          routing_questions(messaging, sender)
          escape(messaging, sender)
        elsif messaging["message"]
          text = messaging["message"]["text"]
          if text == "Help"
            bot_reply = bot_help_reply(sender)
          else
            bot_reply = bot_welcome_reply(sender)
          end
          HTTP.post(url, json: bot_reply)
        end
      end
      render plain: bot_reply
    end
  end

  def go_to_first_question(messaging, sender)
    bot_reply = bot_first_question(sender)
    HTTP.post(url, json: bot_reply)
  end

  def routing_questions(messaging, sender)
    # store the response and mark the first question as answered
    if PriceQuestion.where(sender: sender).blank?
      PriceQuestion.create(sender: sender)
    end
    if LocationQuestion.where(sender: sender).blank?
      LocationQuestion.create(sender: sender)
    end
    if EveningQuestion.where(sender: sender).blank?
      EveningQuestion.create(sender: sender)
    end
    if CityTypeQuestion.where(sender: sender).blank?
      CityTypeQuestion.create(sender: sender)
    end
    if PriceQuestion.where(sender: sender).last.asked == false
      question = PriceQuestion.where(sender: sender)
      question.last.update(asked: true)
      price_answer_content = first_user_answer(messaging, sender)
      PriceAnswer.create!(price_question_id: question.last.id, sender: sender, content: price_answer_content, answered: true)
      bot_reply = bot_second_question(sender)
      HTTP.post(url, json: bot_reply)
    end
    if LocationQuestion.where(sender: sender).last.asked == false && PriceAnswer.where(price_question_id: question.first.id, sender: sender, content: price_answer_content, answered: true)
      question2 = LocationQuestion.where(sender: sender)
      question2.first.update(asked: true)
      location_answer_content = second_user_answer(messaging, sender)
      LocationAnswer.create!(location_question_id: question2.first.id, sender: sender, content: location_answer_content, answered: true)
      bot_reply = bot_third_question(sender)
      HTTP.post(url, json: bot_reply)
    end
    if EveningQuestion.where(sender: sender).first.asked == false && LocationAnswer.where(location_question_id: question2.first.id, sender: sender, content: location_answer_content, answered: true)
      question3 = EveningQuestion.where(sender: sender)
      question3.first.update(asked: true)
      evening_answer_content = third_user_answer(messaging, sender)
      EveningAnswer.create!(evening_question_id: question3.first.id, sender: sender, content: evening_answer_content, answered: true)
      bot_reply = bot_fourth_question(sender)
      HTTP.post(url, json: bot_reply)
    end
    if CityTypeQuestion.where(sender: sender).first.asked == false && EveningAnswer.where(evening_question_id: question3.first.id, sender: sender, content: evening_answer_content, answered: true)
      question4 = CityTypeQuestion.where(sender: sender)
      question4.first.update(asked: true)
      type_answer_content = fourth_user_answer(messaging, sender)
      CityTypeAnswer.create!(city_type_question_id: question4.first.id, sender: sender, content: type_answer_content, answered: true)
      user = User.where(psid: sender).first
      user ||= User.create(psid: sender)
      trip = Trip.where(user: user).first
      trip ||= Trip.create(user: user)
      trip_answer = TripAnswer.create!(price_answer: PriceAnswer.first,
                                             location_answer: LocationAnswer.first,
                                             evening_answer: EveningAnswer.first,
                                             city_type_answer: CityTypeAnswer.first,
                                             trip: trip)
      bot_reply = bot_escape_reply(sender)
      HTTP.post(url, json: bot_reply)
    end

  end

  def first_user_answer(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "£"
      price_answer_content = 'low'
    elsif messaging["message"]["quick_reply"]["payload"]  == "££"
      price_answer_content = 'Medium'
    elsif messaging["message"]["quick_reply"]["payload"] == "£££"
      price_answer_content = 'Expensive'
    end
    price_answer_content
  end

  def second_user_answer(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "europe"
      location_answer_content = 'Europe'
    elsif messaging["message"]["quick_reply"]["payload"] == "further"
      location_answer_content = 'Worldwide'
    end
    location_answer_content
  end

  def third_user_answer(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "bar"
      evening_answer_content = 'Bar'
    elsif messaging["message"]["quick_reply"]["payload"] == "restaurant"
      evening_answer_content = 'Restaurant'
    elsif messaging["message"]["quick_reply"]["payload"] == "locals"
      evening_answer_content = 'Meet the locals'
    end
    evening_answer_content
  end

  def fourth_user_answer(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "culture"
      type_answer_content =  'Culturous'
    elsif messaging["message"]["quick_reply"]["payload"] == "adventure"
      type_answer_content =  'Adventurous'
    elsif messaging["message"]["quick_reply"]["payload"] == "relax"
      type_answer_content =  'Relaxing'
    end
    type_answer_content
  end

  def escape(messaging, sender)
    if messaging["message"]["quick_reply"]["payload"] == "continue"
      bot_reply = bot_results_reply(sender)
    elsif messaging["message"]["quick_reply"]["payload"] == "results"
      bot_reply = bot_results_reply(sender)
    end
    HTTP.post(url, json: bot_reply)
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end

end

