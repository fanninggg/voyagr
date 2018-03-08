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
                      "title": "Welcome to Voyagr, to find your next holiday destination press 'Get Started!",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Get Started!",
                          "payload": "Get Started!",
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
              "text": "We have your results! Would you like to see them now, or narrow them further with more questions",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "See my results \u{1F389}",
                  "payload": "results",
                },
                {
                  "content_type": "text",
                  "title": "Continue \u{1F3CA}",
                  "payload": "continue",
                }
              ]
            }

  bot_standard_reply(response, sender)
end

def bot_results_reply(sender)
  response = {
              "attachment": {
              "type": "template",
              "payload": {
              "template_type": "generic",
                "elements": [{
                "title": "First Result",
                  "subtitle": "This is the first result",
                  "image_url": "https://media-cdn.tripadvisor.com/media/photo-s/0e/85/48/e6/seven-mile-beach-grand.jpg",
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/",
                    "title": "More information"
                  }],
                },
                {
                  "title": "Second result",
                  "subtitle": "This is the second result",
                  "image_url": "https://media.wired.com/photos/59e644e21a7a784c71f7d86d/2:1/w_2500,c_limit/TorontoSkyline-HP-553395387.jpg",
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/",
                    "title": "More information"
                  }],
                },
                {
                  "title": "Third result",
                  "subtitle": "This is the third result",
                  "image_url": "https://www.birdlife.org/sites/default/files/styles/1600/public/bialowieza_forest_c_tomasz_wilk_0.jpg?itok=iXRoJtoL",
                  "buttons":
                  [{
                    "type": "web_url",
                    "url": "https://www.voyagr.co.uk/",
                    "title": "More information"
                  }],
                }]
              }
            }
          }

  bot_standard_reply(response, sender)
end








