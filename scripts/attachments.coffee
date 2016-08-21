module.exports = (robot) ->
  robot.listen(
    (message) ->
      console message
      false
    (response) ->
      response.reply "mini uploaded"
  )