module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log message.photo
      false
    (response) ->
      response.reply "mini uploaded"
  )