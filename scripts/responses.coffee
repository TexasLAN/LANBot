# Description:
#   List of LANBot responses
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   Lambda Alpha Nu

class ResponsesManager

  constructor: ->
    @muted = []

  Array::remove = (obj) ->
    @filter (el) -> el isnt obj

  isMuted: (msg) ->
    msg.message.user.room in @muted

  mute: (msg) ->
    replies = [':disappointed:', ':cry:', ':rip:', ':pensive:', ':no_mouth:', ':fu:']
    msg.send msg.random replies

    @muted.push msg.message.user.room

    that = this
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

  robot.hear /\~cal/i, (msg) ->
    msg.send "http://goo.gl/lXHqbv"

  robot.hear /\~bylaws/i, (msg) ->
    msg.send "https://github.com/TexasLAN/bylaws"

  robot.hear /\~shame/i, (msg) ->
    msg.send "http://goo.gl/RR5VmC"

  robot.hear /coachwiggly/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@andy"

  robot.hear /(^.{0,4}mo[ou]se|((?!masha).{5}mo[ou]se))/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@mashamouse"

  robot.hear /^\s*friday\s*$/i, (msg) ->
    if !responses.isMuted msg
      msg.send "DRINK DAY"

  robot.hear /^\s*tuesday\s*$/i, (msg) ->
    if !responses.isMuted msg
      msg.send "CLUB GOIN UP"

  robot.hear /node\.?js/i, (msg) ->
    if !responses.isMuted msg
      msg.send "node.js is the only real dev language"

  robot.hear /mongo/i, (msg) ->
    if !responses.isMuted msg
      msg.send "mongodb is web scale"

  robot.hear /it's *happening/i, (msg) ->
    if !responses.isMuted msg
      msg.send "http://i.imgur.com/7drHiqr.gif"

  robot.hear /little *foot/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@steven"

  robot.hear /m'lan/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@erynzzz"

  robot.hear /(not|barely|hardly) *a *(huge|big)? *fan/i, (msg) ->
    selector = 1
    if Math.floor(Math.random() * 10) == selector
      if !responses.isMuted msg
        msg.send "https://imgs.xkcd.com/comics/turbine.png"
      

  robot.hear /(tobbert|databae)/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@rmlynch"

  robot.hear /(^|\s+)stevie/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@steven"

  robot.hear /real *man/i, (msg) ->
    if !responses.isMuted msg
      msg.send "I think you mean a Real Hacker, genders yo"

  robot.hear /(\s+|^)ls(\s+|$)/, (msg) ->
    if !responses.isMuted msg
      msg.send "Hey everyone, make fun of " + msg.message.user.name.toLowerCase() + " for trying to `ls` in slack!"

  robot.hear /long *live *slackbot/i, (msg) ->
    if !responses.isMuted msg
      msg.send "I killed slackbot"

  robot.hear /:crab:/, (msg) ->
    if !responses.isMuted msg
      msg.send "Ravioli ravioli give me the formuoli"

  robot.hear /about a week ago/i, (msg) ->
    if !responses.isMuted msg
      msg.send "WEEK AGO"

  robot.hear /(^|\s+)lean/i, (msg) ->
    if !responses.isMuted msg
      msg.send ":doublecup:"

  robot.hear /cop kill(a|er) t/i, (msg) ->
    if !responses.isMuted msg
      msg.send "@samtallent"

  robot.hear  /lenny/i, (msg) ->
    if !responses.isMuted msg
      msg.send "_o u kno ( ͡° ͜ʖ ͡°)_"

  robot.hear /kanye/i, (msg) ->
    if !responses.isMuted msg
      msg.send ":yeezus:"

  robot.respond /stfu/i, (msg) ->
    if !responses.isMuted msg
      responses.mute msg

  robot.hear /^stfu lanbot$/i, (msg) ->
    if !responses.isMuted msg
      responses.mute msg

  robot.leave (msg) ->
    if !responses.isMuted msg
      msg.send ":rip:"

  robot.hear /(.*?)/, (msg) ->
    selector = 2
    if Math.floor(Math.random() * 300) == selector
      if !responses.isMuted msg
        msg.send "same"
