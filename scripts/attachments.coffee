module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log 'msg: ' + message
      console.log '============================'
      console.log 'photo: ' + message.photo
      false
    (response) ->
      response.reply "mini uploaded"
  )