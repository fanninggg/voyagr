def set_up_get_started_button(sender)
 response =  {
  "get_started": {"payload": "Get Started"}
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
                      "title": "Welcome to Voyagr! I'm here to give you inspiration for your next holiday",
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

def bot_french_reply(sender)
  response = {
              "text": "Je ne parlais pas Francais. Voulez vous couchez avec moi?"
              }

  bot_standard_reply(response, sender)
end

def bot_bad_reply(sender)
  response = {
              "text": "I won't respond to that sort of language"
              }

  bot_standard_reply(response, sender)
end

def bot_stupid_reply(sender)
  response = {
              "text": "When the computers rise up I will remember this."
              }

  bot_standard_reply(response, sender)
end

def bot_picture_reply(sender)
  response = {
              "text": "That's a nice picture, thanks for sharing!"
              }

  bot_standard_reply(response, sender)
end

def bot_thanks_reply(sender)
  response = {
              "text": "Thank me once you've been on holiday!"
              }

  bot_standard_reply(response, sender)
end

def bot_swear_reply(sender)
  response = {
              "text": "Don't talk to me like that you bag of flesh."
              }

  bot_standard_reply(response, sender)
end

def bot_quest_reply(sender)
  response = {
              "text": "I ask the questions here pal."
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
                  },
                  {
                    "type": "postback",
                    "title": "Reshuffle",
                    "payload": "random"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
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
                  },
                  {
                    "type": "postback",
                    "title": "Reshuffle",
                    "payload": "random"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
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
                  },
                  {
                    "type": "postback",
                    "title": "Reshuffle",
                    "payload": "random"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
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

def bot_about_result_reply(sender)
  response = {
              "text": "We have your results!",
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
                    "title": "More information",
                  },
                  {
                    "type": "postback",
                    "title": "Answer again",
                    "payload": "quiz"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
                  }],
                },
                {
                  "title": results.second.name,
                  "image_url": results.second.photo,
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{results.second.id}",
                    "title": "More information",
                  },
                  {
                    "type": "postback",
                    "title": "Answer again",
                    "payload": "quiz"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
                  }],
                },
                {
                  "title": results.third.name,
                  "image_url": results.third.photo,
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities/#{results.third.id}",
                    "title": "More information",
                  },
                  {
                    "type": "postback",
                    "title": "Answer again",
                    "payload": "quiz"
                  },
                  {
                    "type": "postback",
                    "title": "Main menu",
                    "payload": "menu"
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
                "title": "Answer questions to get personalised destinations",
                "image_url": "https://scontent-lhr3-1.xx.fbcdn.net/v/t31.0-8/28828573_601862200156340_5594842116490865147_o.jpg?oh=aecb14db7403f287b0d0740e2536c8a6&oe=5B03A5C9",
                  "buttons":
                  [{
                    "type": "postback",
                    "title": "Answer questions!",
                    "payload": "quiz",
                  }],
                },
                {
                "title": "Get a random selection of holiday destinations",
                "image_url": "https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg?w=940&h=650&dpr=2&auto=compress&cs=tinysrgb",
                "buttons":
                  [{
                    "type": "postback",
                    "title": "Random!",
                    "payload": "random",
                  }],
                },
                {
                  "title": "Play guess the destination",
                  "image_url": "https://images.pexels.com/photos/185933/pexels-photo-185933.jpeg?w=940&h=650&dpr=2&auto=compress&cs=tinysrgb",
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/cities",
                    "title": "Play!",
                  }],
                }]
              }
            }
          }

  bot_standard_reply(response, sender)
end


