module.exports = (robot) ->
  robot.listen(
    (msg) ->
      robot.logger.info "hello world"
      true
    (response) ->
      robot.logger.info "goodbye world"
  )