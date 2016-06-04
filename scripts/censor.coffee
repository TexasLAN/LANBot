# Description:
#   LANBot abuse prevention
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   lanbot mute - Mute LANBot for five minutes
#   mute lanbot - Mute LANBot for five minutes
#
# Author:
#   Lambda Alpha Nu

class ResponsesManager

  constructor: ->
    @muted = []

  isMuted: (msg) ->
    msg.user.room in @muted

  mute: (msg) ->
    replies = [':disappointed:', ':cry:', ':rip:', ':pensive:', ':no_mouth:', ':fu:']
    msg.send msg.random replies

    that = this

    setTimeout( ->
      that.muted.push msg.message.user.room
    , 100) # Give LANBot time to reply one last time

    setTimeout( ->
      that.unmute(msg)
    , 5 * 60 * 1000) # 5 minutes

  unmute: (msg) ->
    res = []
    for room in @muted
      if room != msg.message.user.room
        res.push room

    @muted = res

module.exports = (robot) ->

  responses = new ResponsesManager

  robot.respond /stfu|mute/i, (msg) ->
    if !responses.isMuted msg.message
      responses.mute msg

  robot.hear /^(stfu|mute) lanbot$/i, (msg) ->
    if !responses.isMuted msg.message
      responses.mute msg

  isValid = (str) ->
    return str.indexOf("@channel") == -1 &&
      str.indexOf("@here") == -1 &&
      str.indexOf("@group") == -1 &&
      str.indexOf("@everyone") == -1

  robot.responseMiddleware (context, next, done) ->
    # Final check before sending out any message
    return unless isValid(context.strings) && !responses.isMuted context.response.message
    next()

  robot.listenerMiddleware (context, next, done) ->
    # Check if command is valid before processing
    return unless isValid(context.response.message.text)
    next()
