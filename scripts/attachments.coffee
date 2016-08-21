module.exports = (robot) ->
  robot.listen(
    (message) ->
      message.caption? and message.caption is '#mcc'
    (response) ->
      response.reply "mini uploaded"
  )