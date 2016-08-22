module.exports = (robot) ->
  robot.listen(
    (msg) ->
      console.log 'photo: ' + msg.message.photo
      console.log 'caption: ' + msg.message.caption

      false;
    (response) ->
      response.reply "mini uploaded"
  )