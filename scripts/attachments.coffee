module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log message
      console.log '==='
      console.log message.rawMessage
      false
    (response) ->
      response.reply "mini uploaded"
  )