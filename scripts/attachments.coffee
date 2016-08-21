module.exports = (robot) ->
  robot.listen(
    (message) ->
      message.rawMessage?.photo?
    (response) ->
      response.reply "mini uploaded"
  )