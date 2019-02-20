SlackBot = require '../node_modules/hubot-slack/src/bot'

module.exports = (robot) ->

  robot.on "plus-one", (msg) ->

    if msg.direction != '++' 
      return

    bot = new SlackBot(robot, {
      token: process.env.HUBOT_SLACK_TOKEN
    })

    bot.run()

    restricted_ids = ["UD3L5RQDS", "U7B9K764S", "UD344DF7S"]

    bot.client.web.users.list (err, res) ->

      if err || !res.ok
        robot.logger.error "Can't fetch users"
        return

      user_objects = res.members.filter (x) -> x.id in restricted_ids

      sender_identifier = user_objects.filter (x) -> x.name == msg.from
      
      if sender_identifier.length == 0
        return

      result_identifier = user_objects.filter (x) -> x.name == msg.name

      if result_identifier.length == 0
        return

      if result_identifier[0].id in restricted_ids

        if sender_identifier[0].id in restricted_ids

          robot.messageRoom msg.room, "#{msg.from} cannot give points to #{msg.name}"

          robot.messageRoom msg.room, "<@#{result_identifier[0].id}>--"