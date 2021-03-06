# Description:
#   Commands to get and alter MiniCooperCounts scores
#
# Commands:
#   mcc scores - Get clan scores
#   mcc add <score> <name> - Add <score> to <name>
#   mcc take <score> <name> - Take <score> from <name>
module.exports = (robot) ->

  unless process.env.MINICOOPERS_API_URL?
    robot.logger.warning 'The MINICOOPERS_API_URL environment variable not set'
    return

  apiUrl = process.env.MINICOOPERS_API_URL
  adminRole = 'mcadmin'

  urls =
    scores: apiUrl + "/scores"
    add: apiUrl + "/scores/add"
    take: apiUrl + "/scores/take"

  robot.respond /mcc add (.*) (.*)/i, (msg) ->
    unless robot.auth.hasRole(msg.envelope.user, adminRole)
      msg.send "Access denied. You must have this role to use this command: #{adminRole}"
      return
    value = msg.match[1]
    name = msg.match[2]
    json = JSON.stringify({ name: name, value: value})
    msg.http(urls.add)
      .headers("Content-Length": json.length, "Content-Type": "application/json")
      .post(json) (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse body
          summary = "Scores - "
          for position, score of scores
            summary += "#{score.clan}: #{score.score} "
          msg.send summary
        else
          robot.logger.error "Unable to add score.\nStatusCode: #{res.statusCode}, Error: #{err}"
          msg.send "Unable to add score"

  robot.respond /mcc take (.*) (.*)/i, (msg) ->
    unless robot.auth.hasRole(msg.envelope.user, adminRole)
      msg.send "Access denied. You must have this role to use this command: #{adminRole}"
      return
    value = msg.match[1]
    name = msg.match[2]
    json = JSON.stringify({ name: name, value: value })
    msg.http(urls.take)
      .headers("Content-Length": json.length, "Content-Type": "application/json")
      .post(json) (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse body
          summary = "Scores - "
          for position, score of scores
            summary += "#{score.clan}: #{score.score} "
          msg.send summary
        else
          robot.logger.error "Unable to take score.\nStatusCode: #{res.statusCode}, Error: #{err}"
          msg.send "Unable to take score"

  robot.respond /mcc scores/i, (msg) ->
    msg.http(urls.scores).get() (err, res, body) ->
        if res.statusCode is 200
          scores = JSON.parse body
          summary = "Scores - "
          for position, score of scores
            summary += "#{score.clan}: #{score.score} "
          msg.send summary
        else
          robot.logger.error "Unable to get scores.\nStatusCode: #{res.statusCode}, Error: #{err}"
          msg.send "Unable to get scores"
