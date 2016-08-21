module.exports = (robot) ->
  robot.listen(
    (message) ->
      console.log 'msg: ' + JSON.stringify message
      console.log '============================'
      false
    (response) ->
      response.reply "mini uploaded"
  )