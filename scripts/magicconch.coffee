# Description:
#   For all of those tough life decisions you hate to make, the Magic Conch
#	Shell is here for you! Just ask it a question and get an answer immediately
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   help
#
# Author:
#   Colt Whaley

module.exports = (robot) ->
	
	robot.hear /^\s*magic conch\W+(.*)/i, (msg) ->
		if Math.floor(Math.random() * 300) == 2
			msg.send "Go fuck yourself"
		else
			if msg.match[1].split(" ")[0] == "help"
				msg.send "Ask the magic conch a question by sending `magic conch $question`"
			else if msg.match[1].split(" ")[0] == "which"
				msg.send "Neither"
			else
				switch Math.floor(Math.random() * 7)
					when 1 then msg.send "Maybe someday"
					when 2 then msg.send "Follow the seahorse"
					when 3 then msg.send "I don't think so"
					when 4 then msg.send "https://pbs.twimg.com/media/BnV69_bIMAAqY3B.jpg"
					when 5 then msg.send "Yes"
					when 6 then msg.send "Try asking again"

	robot.hear /^\s*magic conch\s*$/i, (msg) ->
		msg.send "You didn't ask a question. To ask a question, send `magic conch $question`"
