# Description:
#   Robot is very encouraging
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot sup me
#   hubot sup name
#   hubot sup all
#
# Author:
#	jc74

remarks = [
    "sup, %?",
    "wazzup, %!",
    "wassup, %?!",
    "whazzup, g",
    "wassup, dude?",
    "whazzup, ma g",
    "whazzup, ma g",
    "what is up, %s?",
    "I say, %s, what is up?",
    "Wassssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssup, %?",
    "Yo, %, sup?"
]
allinclusive = [
    "WAAAAAAAAZZZZZZZZZZZZZZZZUP!",
    "wassup, fam"
]

module.exports = (robot) ->
	robot.respond /(sup )(.*)/i, (msg) ->
		sup = msg.random remarks

		supme = () -> msg.send sup.replace "%", msg.message.user.first_name
		supyou = () -> msg.send sup.replace "%", msg.match[2]

		if msg.match[2] == 'me'
			supme()
		else if msg.match[2] == 'all'
			msg.send msg.random allinclusive
		else
			supyou()
