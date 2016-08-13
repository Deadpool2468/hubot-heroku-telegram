# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   mcc add <score> <name> - Add <score> to <name>
#   mcc scores - Get clan scores

module.exports = (robot) ->

  unless process.env.MINICOOPERS_API_URL?
    robot.logger.warning 'The MINICOOPERS_API_URL environment variable not set'
    return

  apiUrl = process.env.MINICOOPERS_API_URL

  robot.respond /mcc add (.*) (.*)/i, (msg) ->
    score = msg.match[1]
    name = msg.match[2]
    msg.send "Add #{score} to #{name}"

  robot.respond /mcc scores/i, (msg) ->
    msg.http("http://minicoopers.herokuapp.com/api/scores").get() (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse(body)
          msg.send "Scores: #{scores}"
        else
          msg.send "Unable to get scores"
