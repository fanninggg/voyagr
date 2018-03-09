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
                      "title": "Welcome to Voyagr, to find your next holiday destination press 'Let's go!",
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
              "text": "Need help? Just type 'Hey' below to start"
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








