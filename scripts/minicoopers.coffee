# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   mc add <name> <score> - Add <score> to <name>

module.exports = (robot) ->
  robot.respond /mc add (.*) (.*)/i, (msg) ->
    name = msg.match[1]
    score = msg.match[2]
    msg.send "Add #{score} to #{name}"
