module.exports = (robot) ->
  robot.listen(
    (msg) ->
      console.log 'photo: ' + JSON.stringify msg.message.photo
      console.log '============================'
      false
    (response) ->
      response.reply "mini uploaded"
  )