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

  sendMessage: (msg, response) ->
      if !@isMuted msg
          msg.send response
          
module.exports = (robot) ->

  responses = new ResponsesManager
  @count

  robot.hear /\~cal/i, (msg) ->
    msg.send "http://goo.gl/lXHqbv"

  robot.hear /\~bylaws/i, (msg) ->
    msg.send "https://github.com/TexasLAN/bylaws"

  robot.hear /\~shame/i, (msg) ->
    msg.send "http://goo.gl/RR5VmC"

  robot.hear /git\ status/i, (msg) ->
    if !responses.isMuted msg
      msg.send "```\n" +
               "On branch slack\n" +
               "Your branch is up-to-date with 'you/fucking/idiot'\n" +
               "Untracked files:\n\n" +
               "  (use \"git add <file>...\" to include in what will be committed)\n\n" +
               "      a/brain.cpp\n\n" +
               "nothing added to commit but untracked files present (use \"git add\" to track)\n" +
               "```"

  robot.hear /coachwiggly/i, (msg) ->
    responses.sendMessage msg, "@andy"

  robot.hear /(^.{0,4}mo[ou]se|((?!masha).{5}mo[ou]se))/i, (msg) ->
    responses.sendMessage msg, "@mashamouse"

  robot.hear /^\s*friday\s*$/i, (msg) ->
    responses.sendMessage msg, "DRINK DAY"

  robot.hear /^\s*tuesday\s*$/i, (msg) ->
    responses.sendMessage msg, "CLUB GOIN UP"

  robot.hear /^\s*pizza\s*$/i, (msg) ->
    responses.sendMessage msg, "@addy"

  robot.hear /it's *happening/i, (msg) ->
    responses.sendMessage msg, "http://i.imgur.com/7drHiqr.gif"

  robot.hear /little *foot/i, (msg) ->
    responses.sendMessage msg, "@steven"

  robot.hear /m'lan/i, (msg) ->
    responses.sendMessage msg, "@erynzzz"

  robot.hear /(not|barely|hardly) *a *(huge|big)? *fan/i, (msg) ->
    responses.sendMessage msg, "https://imgs.xkcd.com/comics/turbine.png"

  robot.hear /(tobbert|databae)/i, (msg) ->
    responses.sendMessage msg, "@rmlynch"

  robot.hear /(^|\s+)stevie/i, (msg) ->
    responses.sendMessage msg, "@steven"

  robot.hear /real *man/i, (msg) ->
    responses.sendMessage msg, "I think you mean a Real Hacker, genders yo"

  robot.hear /(\s+|^)ls(\s+|$)/, (msg) ->
    responses.sendMessage msg, "Hey everyone, make fun of " + msg.message.user.name.toLowerCase() + " for trying to `ls` in slack!"

  robot.hear /long *live *slackbot/i, (msg) ->
    responses.sendMessage msg, "I killed slackbot"

  robot.hear /:crab:/, (msg) ->
    responses.sendMessage msg, "Ravioli ravioli give me the formuoli"

  robot.hear /about a week ago/i, (msg) ->
    responses.sendMessage msg, "WEEK AGO"

  robot.hear /(^|\s+)lean/i, (msg) ->
    responses.sendMessage msg, ":doublecup:"

  robot.hear /cop kill(a|er) t/i, (msg) ->
    responses.sendMessage msg, "@samtallent"

  robot.hear  /lenny/i, (msg) ->
    responses.sendMessage msg, "_o u kno ( ͡° ͜ʖ ͡°)_"

  robot.hear /\~cake/i, (msg) ->
    cake_replies = ["http://imgur.com/xpv1gZz", "http://imgur.com/blKDv1f", "http://imgur.com/BEqVbhZ", "http://imgur.com/b7D9Svx", "http://imgur.com/iFcbsoF", "http://imgur.com/NjDBhvE"]
    responses.sendMessage msg, cake_replies[@count]
    if(@count != 6)
      @count += 1
    else 
      @count = 0
  
  robot.hear /kanye/i, (msg) ->
    responses.sendMessage msg, ":yeezus:"

  robot.respond /stfu/i, (msg) ->
    if !responses.isMuted msg
      responses.mute msg

  robot.hear /^stfu lanbot$/i, (msg) ->
    if !responses.isMuted msg
      responses.mute msg

  robot.leave (msg) ->
    responses.sendMessage msg, ":rip:"
  
  robot.hear /(^|\s+)doug/i, (msg) ->
    responses.sendMessage msg, "@arrdem :doge:"

  robot.hear /(^|\s+)alright/i, (msg) ->
    responses.sendMessage msg, "Alls my life I has to FIGHT!! :yeezus:"
    
  robot.hear /^\s*texas!?\s*$/i, (msg) ->
    responses.sendMessage msg, "FIGHT"
    
  robot.hear /^\s*ou!?\s*$/i, (msg) ->
    responses.sendMessage msg, "SUCKS"

  robot.catchAll (msg) ->
    selector = 2
    
    if Math.floor(Math.random() * 10000) == selector
      responses.sendMessage msg, "http://dontecnico.com/wp-content/uploads/2014/08/1-millionth-visitor.gif"

    if Math.floor(Math.random() * 300) == selector
      responses.sendMessage msg, "same"

    if Math.floor(Math.random() * 1000) == selector
      now = new Date
      hour = (now.getHours() - 1) % 12 # decremented because hubot is in eastern time zone
      minute = now.getMinutes()

      responses.sendMessage msg, "it's " + hour + ":" + minute + " and OU still sucks"
