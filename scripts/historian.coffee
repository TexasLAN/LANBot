# Description:
#   Tracks users who use LANBot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   lanbot history - Get ten most recent users who used commands
#
# Author:
#   Lambda Alpha Nu

class HistorianManager

  constructor: ->
    @history = []

  addHistory: (room, user, cmd) ->
    # Keep history capped and clear out older half when needed
    if @history.length == 500
      @history = @history.splice(Math.floor(@history.length / 2), @history.length);

    # Only save valid commands
    if cmd
      @history.push({room, user, cmd})

  printHistory: (msg) ->
    msg.send JSON.stringify(@history)
    count = 0
    for h in @history by -1
      if h["room"] == msg.message.user.room and count < 10
        msg.send "#{h["user"].slice(0, 1) + "." + h["user"].slice(1)} :arrow_right: #{h["cmd"]}"
        count++

    if @history.length == 0
      msg.send "No history found for this room."

module.exports = (robot) ->

  responses = new HistorianManager

  robot.respond /history/i, (msg) ->
    responses.printHistory msg

  robot.listenerMiddleware (context, next, done) ->
    msg = context.response.message
    responses.addHistory msg.user.room, msg.user.name, msg.text
    next()
