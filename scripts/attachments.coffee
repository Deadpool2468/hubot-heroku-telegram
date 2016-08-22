module.exports = (robot) ->
  robot.listen(
    (msg) ->
      console.log 'photo: ' + msg.message.photo
      console.log 'caption: ' + msg.message.caption

      isMccPhoto = msg.message.photo and msg.message.caption and msg.message.caption is 'mcc'
      console.log 'isMccPhoto: ' + isMccPhoto

      isMccPhoto
    (response) ->
      response.reply "mini uploaded"
  )