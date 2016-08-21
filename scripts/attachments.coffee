module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log 'msg: ' + message
      console.log '============================'
      console.log 'raw msg: ' + message.rawMessage
      false
    (response) ->
      response.reply "mini uploaded"
  )