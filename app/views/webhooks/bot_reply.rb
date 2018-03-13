def set_up_get_started_button(sender)
 response =  {
  "get_started": {"payload": "<postback_payload>"}
}

bot_standard_reply(response, sender)
end

def bot_standard_reply(response, sender)
  bot_standard_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": response
              }
end

def bot_welcome_reply(sender)
  response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "Welcome to Voyagr! I'm here to give you inspiration for your next holiday destination",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Let's go!",
                          "payload": "Let's go!",
                        }
                      ],
                    }]
                  }
                }
              }

  bot_standard_reply(response, sender)
end

def bot_help_reply(sender)
  response = {
              "text": "Need help? Just type 'Hi' below to start"
              }

  bot_standard_reply(response, sender)
end

def bot_love_reply(sender)
  response = {
              "text": "All, everything that I understand, I only understand because I love."
              }

  bot_standard_reply(response, sender)
end

def bot_stupid_reply(sender)
  response = {
              "text": "When the computers rise up I will remember this."
              }

  bot_standard_reply(response, sender)
end

def bot_thanks_reply(sender)
  response = {
              "text": "Thanks! I think I'm doing a great job too!"
              }

  bot_standard_reply(response, sender)
end

def bot_continue_reply(sender)
  response = {
              "text": "But anyway, let's find a holiday! Type 'Hi' to get started"
              }

  bot_standard_reply(response, sender)
end

def bot_confused_reply(sender)
  response = {
              "text": "I'm sorry, I don't understand that response. Try typing 'Hi' instead!"
              }

  bot_standard_reply(response, sender)
end

def bot_suggestions(sender, suggestions)
   response = {
              "attachment": {
              "type": "template",
              "payload": {
              "template_type": "generic",
                "elements": [{
                "title": suggestions.first.first[:name],
                "image_url": suggestions.first.first[:photo],
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{suggestions.first.first[:id]}",
                    "title": "More information"
                  }],
                },
                {
                  "title": suggestions.second.first[:name],
                  "image_url": suggestions.second.first[:photo],
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{suggestions.second.first[:id]}",
                    "title": "More information"
                  }],
                },
                {
                  "title": suggestions.third.first[:name],
                  "image_url": suggestions.third.first[:photo],
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{suggestions.third.first[:id]}",
                    "title": "More information"
                  }],
                }]
              }
            }
          }

  bot_standard_reply(response, sender)
end

def bot_first_question(sender)
  response = {
              "text": PriceQuestion.first.content,
              "quick_replies": [
                { "content_type": "text", "title": PriceAnswer.first.title, "payload": PriceAnswer.first.payload},
                { "content_type": "text", "title": PriceAnswer.second.title, "payload": PriceAnswer.second.payload},
                { "content_type": "text", "title": PriceAnswer.third.title, "payload": PriceAnswer.third.payload}
              ]
            }
  p response

  bot_standard_reply(response, sender)
end

def bot_second_question(sender)
  response = {
                "text": LocationQuestion.first.content,
                "quick_replies": [
                  { "content_type": "text", "title": LocationAnswer.first.title, "payload": LocationAnswer.first.payload},
                  { "content_type": "text", "title": LocationAnswer.second.title, "payload": LocationAnswer.second.payload},
                ]
              }

  bot_standard_reply(response, sender)
end

def bot_third_question(sender)
  response = {
                "text": EveningQuestion.first.content,
                "quick_replies": [
                  { "content_type": "text", "title": EveningAnswer.first.title, "payload": EveningAnswer.first.payload},
                  { "content_type": "text", "title": EveningAnswer.second.title, "payload": EveningAnswer.second.payload},
                  { "content_type": "text", "title": EveningAnswer.third.title, "payload": EveningAnswer.third.payload},
                ]
              }

  bot_standard_reply(response, sender)
end

def bot_fourth_question(sender)
  response = {
                "text": CityTypeQuestion.first.content,
                "quick_replies": [
                  { "content_type": "text", "title": CityTypeAnswer.first.title, "payload": CityTypeAnswer.first.payload},
                  { "content_type": "text", "title": CityTypeAnswer.second.title, "payload": CityTypeAnswer.second.payload},
                  { "content_type": "text", "title": CityTypeAnswer.third.title, "payload": CityTypeAnswer.third.payload},
                ]
              }


  bot_standard_reply(response, sender)
end

def bot_escape_reply(sender)
  response = {
              "text": "We have your results! If you want to redo the quiz, type 'Redo' to start over",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "See my results \u{1F389}",
                  "payload": "results",
                }
              ]
            }

  bot_standard_reply(response, sender)
end

def bot_results_reply(sender, results)
  response = {
              "attachment": {
              "type": "template",
              "payload": {
              "template_type": "generic",
                "elements": [{
                "title": results.first.name,
                "image_url": results.first.photo,
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{results.first.id}",
                    "title": "More information"
                  }],
                },
                {
                  "title": results.second.name,
                  "image_url": results.second.photo,
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{results.second.id}",
                    "title": "More information"
                  }],
                },
                {
                  "title": results.third.name,
                  "image_url": results.third.photo,
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{results.third.id}",
                    "title": "More information"
                  }],
                }]
              }
            }
          }

  bot_standard_reply(response, sender)
end

def bot_choices_reply(sender)
  response = {
              "attachment": {
              "type": "template",
              "payload": {
              "template_type": "generic",
                "elements":
                [{
                "title": "Get a random selection of holiday destinations",
                "image_url": "http://www.hometohomecalls.com/wp-content/uploads/2015/11/Holiday.jpg",
                  "buttons":
                  [{
                    "type": "postback",
                    "title": "Random!",
                    "payload": "random",
                  }],
                },
                {
                  "title": "Take our quiz to find a more tailored destination",
                  "image_url": "http://home.bt.com/images/test-your-knowledge-of-2016-with-our-jumbo-trivia-quiz-136412309722203901-161222142527.jpg",
                  "buttons":
                  [{
                    "type": "postback",
                    "title": "Take the quiz!",
                    "payload": "quiz",
                  }],
                }]
              }
            }
          }

  bot_standard_reply(response, sender)
end


