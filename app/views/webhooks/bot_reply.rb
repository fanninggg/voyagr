def my_standard_reply(response, sender)
  my_standard_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": response
              }
end

def welcome_reply(sender)
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
  my_standard_reply(response, sender)
end

def first_question_reply(sender)
  response = {
              "text": "How much do you want to spend?",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "\u{1F4B0}",
                  "payload": "£",
                },
                {
                  "content_type": "text",
                  "title": "\u{1F4B0 1F4B0}",
                  "payload": "££",
                },
                {
                  "content_type": "text",
                  "title": "\u{1F4B0 1F4B0 1F4B0}",
                  "payload": "£££",
                }
              ]
            }

  my_standard_reply(response, sender)
end

def second_question_reply(sender)
  response = {
              "text": "Do you want to travel in Europe or further afield?",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "Europe \u{1F1EA 1F1FA}",
                  "payload": "europe",
                },
                {
                  "content_type": "text",
                  "title": "Further \u{1F30F}",
                  "payload": "further",
                }
              ]
            }

  my_standard_reply(response, sender)
end

def third_question_reply(sender)
  response = {
              "text": "What would be your perfect evening on holiday?",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "Restaurant \u{1F35D}",
                  "payload": "restaurant",
                },
                {
                  "content_type": "text",
                  "title": "Drinking in a bar \u{1F378}",
                  "payload": "bar",
                },
                {
                  "content_type": "text",
                  "title": "Meeting Locals \u{1F483}",
                  "payload": "locals",
                }
              ]
            }

  my_standard_reply(response, sender)
end

def fourth_question_reply(sender)
  response = {
              "text": "What kind of holiday do you want?",
              "quick_replies": [
                {
                  "content_type": "text",
                  "title": "Cultural \u{1F3DB FE0F}",
                  "payload": "culture",
                },
                {
                  "content_type": "text",
                  "title": "Adventurous \u{1F9D7}",
                  "payload": "adventure",
                },
                {
                  "content_type": "text",
                  "title": "Relaxing \u{1F3D6}",
                  "payload": "relax",
                }
              ]
            }

  my_standard_reply(response, sender)
end

def escape_reply(sender)
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

  my_standard_reply(response, sender)
end








