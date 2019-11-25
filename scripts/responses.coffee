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

module.exports = (robot) ->
  @count

  robot.hear /\~cal/i, (msg) ->
    msg.send "https://goo.gl/BD9zrU"

  robot.hear /\~bylaws/i, (msg) ->
    msg.send "https://github.com/TexasLAN/bylaws"

  robot.hear /\~shame/i, (msg) ->
    msg.send "http://goo.gl/RR5VmC"

  robot.hear /~source/i, (msg) ->
    msg.send "https://github.com/TexasLAN/LANBot"

  robot.hear /~suggestions/i, (msg) ->
    msg.send "https://goo.gl/NahhsA"

  robot.hear /~admin/i, (msg) ->
    replies = ['HELP', 'HAAAAALP', "HELP HELP WE'RE BEING REPRESSED", "INSTANT REGRET"]
    msg.send "DREW " + msg.random replies

  robot.hear /~help/i, (msg) ->
    msg.send "Bot features:\n" +
             "```\n" +
             " ~cal    - LAN official calendar\n" +
             " ~bylaws - LAN official bylaws\n" +
             " ~shame  - Lanbot wall of shame\n" +
             " ~source - Source code for this bot\n" +
             " ~suggestions  - Omega feedback form\n" +
             " ~admin  - (probably) summon an admin to your aid\n" +
             "```\n"

  robot.hear /git\ status/i, (msg) ->
    msg.send "```\n" +
             "On branch slack\n" +
             "Your branch is up-to-date with 'you/fucking/idiot'\n" +
             "Untracked files:\n\n" +
             "  (use \"git add <file>...\" to include in what will be committed)\n\n" +
             "      a/brain.cpp\n\n" +
             "nothing added to commit but untracked files present (use \"git add\" to track)\n" +
             "```"

  robot.hear /^make(\s(clean|all|lanbot))*\s*$/i, (msg) ->
    msg.send "make: *** No targets specified and no makefile found.  Stop."

  robot.hear /coachwiggly/i, (msg) ->
    msg.send "@andy"

  robot.hear /^\s*friday\s*$/i, (msg) ->
    msg.send "DRINK DAY"

  robot.hear /^\s*tuesday\s*$/i, (msg) ->
    msg.send "CLUB GOIN UP"

  robot.hear /^\s*pizza\s*$/i, (msg) ->
    msg.send "@addy"

  robot.hear /it's *happening/i, (msg) ->
    msg.send "http://i.imgur.com/7drHiqr.gif"

  robot.hear /little *foot/i, (msg) ->
    msg.send "@steven"

  robot.hear /m'lan/i, (msg) ->
    msg.send "@erynzzz"

  robot.hear /(tobbert|databae)/i, (msg) ->
    msg.send "@rmlynch"

  robot.hear /real *man/i, (msg) ->
    msg.send "I think you mean a Real Hacker, genders yo"

  robot.hear /(\s+|^)ls(\s+|$)/, (msg) ->
    msg.send "Hey everyone, make fun of " + msg.message.user.name.toLowerCase() + " for trying to `ls` in slack!"

  robot.hear /long *live *slackbot/i, (msg) ->
    msg.send "I killed slackbot"

  robot.hear /slackbot *is *dead/i, (msg) ->
    msg.send "Long live Slackbot"

  robot.hear /(:owo:)/i, (msg) ->
    msg.send "whats this?"

  robot.hear /:crab:/, (msg) ->
    msg.send "Ravioli ravioli give me the formuoli"

  robot.hear /about a week ago/i, (msg) ->
    msg.send "WEEK AGO"

  robot.hear /(^|\s+)lean/i, (msg) ->
    msg.send ":doublecup:"

  robot.hear /cop kill(a|er) t/i, (msg) ->
    msg.send "@samtallent"

  robot.hear  /lenny/i, (msg) ->
    msg.send "_o u kno ( ͡° ͜ʖ ͡°)_"

  robot.hear  /aggie/i, (msg) ->
    msg.send "http://i.imgur.com/zsRHs3U.jpg"

  robot.hear /\~cake/i, (msg) ->
    cake_replies = ["http://imgur.com/xpv1gZz", "http://imgur.com/blKDv1f", "http://imgur.com/BEqVbhZ", "http://imgur.com/b7D9Svx", "http://imgur.com/iFcbsoF", "http://imgur.com/NjDBhvE"]
    msg.send cake_replies[@count]
    if(@count != 6)
      @count += 1
    else
      @count = 0

  robot.hear /(?!:)kanye(?!:)/i, (msg) ->
    msg.send ":yeezus:"

  robot.hear /\byc/i, (msg) ->
    msg.send "all hail the yuppie cabal"

  robot.hear /(^|\s+)doug/i, (msg) ->
    msg.send "@arrdem :doge:"

  robot.hear /^\s*texas!?\s*$/i, (msg) ->
    msg.send "FIGHT"

  robot.hear /^\s*ou!?\s*$/i, (msg) ->
    msg.send "SUCKS"

  robot.hear /^([^:]python[^:]|anaconda)/i, (msg) ->
    v = Math.floor(Math.random() * 100)
    if v == 6
      msg.send "you snek looking for prey and when you find it you strikes with a raging fury, unless she say's no.."
    if v == 7
      msg.send

  robot.respond /rule (1|one)$/i, (msg) ->
    msg.send "1. have a life"

  robot.respond /rule (2|two)$/i, (msg) ->
    msg.send "2. be up front and honest"

  robot.respond /rule (3|three)$/i, (msg) ->
    msg.send "3. take no for an answer. no seriously do."

  robot.respond /rule (4|four)$/i, (msg) ->
    msg.send "4. you aren't exclusive until you say you're exclusive"

  robot.respond /rule (5|five)$/i, (msg) ->
    msg.send "5. Reid if you want to meet girls you need to do things that girls do"

  robot.hear /rule (34|thirty four)$/i, (msg) ->
    msg.send "34. If it is on the internet, there is porn of it"

  robot.hear /@pledges/i, (msg) ->
    msg.send  "<@UNNBLK3GR>" + # Alvin Lo
              " <@UNN4ZFBLH>" + # Cionne Nodd
              " <@UNG0J4P2N>" + # Hannah Alnemer
              " <@UNH3D8BDZ>" + # Jaden Hyde
              " <@UNUHUCN6L>" + # Jared Kahl
              " <@UNWR6DQT0>" + # Neel Gopal
              " <@UNWPG6QCE>"  # Siddhesh Krishnan
    # Tutorial:
    # 1) Navigate to https://www.texaslan.org/users/ and view Pledges (order alphabetically)
    # 2) Open the Slack desktop app, hamburger button (top right), Workspace Directory
    # 3) Search for each pledge alphabetically
    #     a) Select their profile
    #     b) Click the dropdown next to Call and Message
    #     c) Copy member ID
    # https://api.slack.com/docs/message-formatting#linking_to_channels_and_users
    # https://api.slack.com/changelog/2017-09-the-one-about-usernames

  robot.catchAll (msg) ->
    selector = 2

    if Math.floor(Math.random() * 10000) == selector
      msg.send "http://dontecnico.com/wp-content/uploads/2014/08/1-millionth-visitor.gif"

    if Math.floor(Math.random() * 420) == selector
      msg.send "same"

    if Math.floor(Math.random() * 2000) == selector
      now = new Date()
      # decremented because hubot is in eastern time zone
      now.setHours((now.getHours() - 1) % 24)
      hours = now.getHours() % 12
      if hours == 0
        hours = 12
      minutes = now.getMinutes()
      if minutes < 10
        minutes = "0" + minutes
      msg.send "It's " + hours + ":" + minutes + " and OU still sucks"
