window.initSelect2 = ->
  $("#question_tags").select2
    width: 400
$ ->
  $("#save_question").click (e) ->
    e.preventDefault()
    $("#question_submit").trigger("click")
  $("#create_question_button").click (e) ->
    e.preventDefault()
    window.initSelect2()
  window.initSelect2()
"use strict"

# first we make sure annyang started succesfully
if annyang
  
  # define the functions our commands will run.
  answerQuestion = (question) ->
    console.log("#{question}")
    return
  # define our commands.
  # * The key is what you want your users to say say.
  # * The value is the action to do.
  #   You can pass a function, a function name (as a string), or write your function as part of the commands object.
  commands =
    ":question": answerQuestion

  
  # OPTIONAL: activate debug mode for detailed logging in the console
  annyang.debug()
  
  # Add voice commands to respond to
  annyang.addCommands commands
  
  # OPTIONAL: Set a language for speech recognition (defaults to English)
  annyang.setLanguage "en"
  
  # Start listening. You can call this here, or attach this call to an event, button, etc.
  annyang.start()
else
  $(document).ready ->
    $("#unsupported").fadeIn "fast"
    return

scrollTo = (identifier, speed) ->
  $("html, body").animate
    scrollTop: $(identifier).offset().top
  , speed or 1000
  return
