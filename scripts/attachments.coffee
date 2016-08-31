module.exports = (robot) ->
  robot.listen(
    (msg) ->
      robot.logger.info "photo: #{msg.message.photo}"
      robot.logger.info "caption: #{msg.message.caption}"

      isMccPhoto = msg.message and msg.message.photo and msg.message.caption and msg.message.caption.toLowerCase() is 'mcc'

      robot.logger.info "isMccPhoto: #{isMccPhoto}"

      isMccPhoto
    (response) ->
      robot.logger.info "response: #{response}"
  )