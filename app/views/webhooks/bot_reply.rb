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
                      "subtitle": "Tap a button to answer.",
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

  my_standard_reply(response, sender)
end

def second_question_reply(sender)
  response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "Do you want to explore Europe or go further afield?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Europe",
                          "payload": "Europe",
                        },
                        {
                          "type": "postback",
                          "title": "Further Afield",
                          "payload": "Further Afield",
                        }
                      ],
                    }],
                  }
                }
              }

  my_standard_reply(response, sender)
end

def third_question_reply(sender)
  response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "How would you describe your perfect evening?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Drinking in a bar",
                          "payload": "bar",
                        },
                        {
                          "type": "postback",
                          "title": "Eating in a restaurant",
                          "payload": "restaurant",
                        },
                        {
                          "type": "postback",
                          "title": "Meeting the locals",
                          "payload": "locals",
                        }
                      ],
                    }],
                  }
                }
              }

  my_standard_reply(response, sender)
end

def fourth_question_reply(sender)
  response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "What type of holiday would you like?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Cultural",
                          "payload": "culture",
                        },
                        {
                          "type": "postback",
                          "title": "Adventurous",
                          "payload": "adventure",
                        },
                        {
                          "type": "postback",
                          "title": "Relaxing",
                          "payload": "relax",
                        }
                      ],
                    }],
                  }
                }
              }

  my_standard_reply(response, sender)
end

def escape_reply(sender)
  response = {
                "attachment": {
                  "type": "template",
                  "payload": {
                    "template_type": "generic",
                    "elements": [{
                      "title": "Ok! We have some results for you... Would you like to get more specific or exit now and get your results?",
                      "subtitle": "Tap a button to answer.",
                      "buttons": [
                        {
                          "type": "postback",
                          "title": "Continue",
                          "payload": "continue",
                        },
                        {
                          "type": "postback",
                          "title": "Get my results",
                          "payload": "results",
                        }
                      ],
                    }],
                  }
                }
              }

  my_standard_reply(response, sender)
end








