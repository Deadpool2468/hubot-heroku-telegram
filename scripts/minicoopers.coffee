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

  urls =
    scores: apiUrl + "/scores"
    add: apiUrl + "/scores/add"

  robot.respond /mcc add (.*) (.*)/i, (msg) ->
    value = msg.match[1]
    name = msg.match[2]
    data = JSON.stringify({"name": name, "value": value})
    msg.http(urls.scores).post(data) (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse body
          summary = "Scores - "
          for position, score of scores
            summary += "#{score.clan}: #{score.score} "
          msg.send summary
        else
          msg.send "Unable to get scores"

  robot.respond /mcc scores/i, (msg) ->
    msg.http(urls.scores).get() (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse body
          summary = "Scores - "
          for position, score of scores
            summary += "#{score.clan}: #{score.score} "
          msg.send summary
        else
          msg.send "Unable to get scores"
