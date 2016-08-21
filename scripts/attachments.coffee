module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log message.chat.photo
      false
    (response) ->
      response.reply "mini uploaded"
  )