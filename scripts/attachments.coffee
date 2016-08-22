module.exports = (robot) ->
  robot.listen(
    (msg) ->
      console.log 'photo: ' + msg.message.photo
      console.log 'caption: ' + msg.message.caption

      isMccPhoto = msg.message and msg.message.photo and msg.message.caption and msg.message.caption.toLowerCase() is 'mcc'

      console.log 'isMccPhoto: ' + isMccPhoto

      isMccPhoto
    (cb) ->
      console.log 'cb: ' + cb
  )