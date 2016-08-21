module.exports = (robot) ->
  robot.listen(
    (msg) ->
      msg.message.photo and msg.message.caption? and msg.message.caption is 'mcc'
    (response) ->
      response.reply "mini uploaded"
  )