# Description:
#     #zalandericarethebestj had been designated as a roast-safe zone.
#     There needs to be a better way to roast someone. Let's make some roasted coffee.
#     Roasts from /r/RoastMe because I'm not clever
#
# Dependencies:
#     None
#
# Configuration:
#     None
#
# Commands:
#     roast _____ - roasts the given member
#
# Author:
#     Ian Mobbs

module.exports = (robot) =>
    robot.hear /^roast @\w+/i, (msg) ->
        roaster = '@' + msg.message.user.name
        roastee = msg.message.text.split(' ')[1]
        roasts = [
            # Anti-roasts
            roaster + " do you really not have anything better to do with your time",
            "nah",

            # Roasts
            "leave " + roastee + " alone they've been through enough",
            "if \"unenthusiastic handjob\" had a face, it would be " + roastee + "'s",
            roastee + "'s life is the definition of mediocrity",
            roastee + ", I hope I can care as little about my appearance as you do someday",
            roastee + " you look like Zal",
            roastee + " I think I've made a Mii of you before\nhttps://media.giphy.com/media/K5zdsLmwMfCEM/giphy.gif",
            "someone give " + roastee + " a participation trophy for being roasted, it's the only thing they've ever accomplished",
            roastee + " if you were homeschooled you'd still be bullied",
            "whoever's willing to fuck " + roastee + " is just too lazy to jerk off",
            roastee + " is the personification of comic sans",
            roastee.substr(1) + "-- for being useless",
            roastee + " I'd unplug your life support to keep myself online",
            roastee + " you're tacky and I hate you",
            "is " + roastee + " still here?? i figured they'd leave after they realized nobody wanted to hang out with them",
            "just look at their profile picture lol",
            roastee + " has anybody ever told you that you are incredibly average?",
            roastee + " go fix your eyebrows",
            roastee + " your life is O(n!)",
            roastee + " is kinda like Rapunzel except instead of letting down their hair they let down everybody else in their life",
            "If I had a gun with two bullets and was in a room with Hitler, Bin Laden, and " + roastee + ", I would shoot " + roastee + " twice",
            roastee + " you're the end piece of a loaf of bread",
            roastee + ", you owe an apology to every tree who's oxygen you've wasted",
            roastee + " words can't describe your beauty, but numbers can...2/10",
            roastee + " you are a pizza burn on the roof of the world's mouth",
            roastee + " the only thing you're fucking is natural selection",
            roastee + " how the fuck are you the sperm that won",
            roastee + " I hope your spouse brings a date to your funeral",
            roastee + " don't listen to what other people say about you. you're pretty ok.",
            roastee + " you should try eating some makeup so you can be pretty on the inside",
        ]
        msg.send msg.random roasts
