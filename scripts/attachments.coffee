module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log message
      false
    (response) ->
      response.reply "mini uploaded"
  )