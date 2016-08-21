module.exports = (robot) ->
  robot.listen(
    (message) ->
      message.photo
    (response) ->
      response.reply "photo uploaded"
  )