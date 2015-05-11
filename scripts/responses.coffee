module.exports = (robot) ->

  robot.hear /\~cal/i, (msg) ->
    msg.send "http://goo.gl/lXHqbv"

  robot.hear /\~bylaws/i, (msg) ->
    msg.send "https://github.com/TexasLAN/bylaws"

  robot.hear /\~shame/i, (msg) ->
    msg.send "http://goo.gl/RR5VmC"

  robot.hear /coachwiggly/i, (msg) ->
    msg.send "@andy"

  robot.hear /(^.{0,4}mo[ou]se|((?!masha).{5}mo[ou]se))/i, (msg) ->
    msg.send "@mashamouse"

  robot.hear /^\s*friday\s*$/i, (msg) ->
    msg.send "DRINK DAY"

  robot.hear /^\s*tuesday\s*$/i, (msg) ->
    msg.send "CLUB GOIN UP"

  robot.hear /node\.?js/i, (msg) ->
    msg.send "node.js is the only real dev language"

  robot.hear /mongo/i, (msg) ->
    msg.send "mongodb is web scale"

  robot.hear /it's *happening/i, (msg) ->
    msg.send "http://i.imgur.com/7drHiqr.gif"

  robot.hear /little *foot/i, (msg) ->
    msg.send "@steven"

  robot.hear /m'lan/i, (msg) ->
    msg.send "@erynzzz"

  robot.hear /(not|barely|hardly) *a *(huge|big)? *fan/i, (msg) ->
    msg.send "https://imgs.xkcd.com/comics/turbine.png"
    
  robot.hear /(tobbert|databae)/i, (msg) ->
    msg.send "@rmlynch"

  robot.hear /(^|\s+)stevie/i, (msg) ->
    msg.send "@steven"

  robot.hear /estevie/i, (msg) ->
    msg.send "@stevendiaz"

  robot.hear /real *man/i, (msg) ->
    msg.send "I think you mean a Real Hacker, genders yo"
  
  robot.hear /(\s+|^)ls(\s+|$)/, (msg) ->
    msg.send "Hey everyone, make fun of " + msg.message.user.name.toLowerCase() + " for trying to `ls` in slack!"
    
  robot.hear /long *live *slackbot/i, (msg) ->
    msg.send "I killed slackbot"
    
  robot.hear /:crab:/, (msg) ->
    msg.send "Ravioli ravioli give me the formuoli"
  
  robot.hear /about a week ago/i, (msg) ->
    msg.send "WEEK AGO"
    
  robot.hear /lean/i, (msg) ->
    msg.send "did someone say _lean_? :doublecup:"
    
  robot.hear /~source/i, (msg) ->
    msg.send "https://github.com/TexasLAN/LANBot"
