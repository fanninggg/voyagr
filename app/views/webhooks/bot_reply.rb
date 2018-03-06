def reply(sender)
   response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "Is this the right picture?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Yes!",
                          "payload": "yes",
                        },
                        {
                          "type": "postback",
                          "title": "No!",
                          "payload": "no",
                        }
                      ],
                    }]
                  }
                }
              }

   my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": response
              }
  return my_reply
end

def welcome_reply(sender)
   response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "Welcome to Voyagr, to find your next holiday destination press 'Get Started!",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Get Started!",
                          "payload": "yes",
                        }
                      ],
                    }]
                  }
                }
              }

   my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": response
              }
  return my_reply
end

def first_question(sender)
   response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "How much are you willing to pay for your holiday?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "£",
                          "payload": "£",
                        },
                        {
                          "type": "postback",
                          "title": "££",
                          "payload": "££",
                        },
                        {
                          "type": "postback",
                          "title": "£££",
                          "payload": "£££",
                        },
                      ],
                    }],
                  }
                }
              }

   my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": response
              }
  return my_reply
end
