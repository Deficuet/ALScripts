return {
	fadeOut = 1.5,
	mode = 2,
	id = "JIARIXINTIAODAYOULUN44",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"Pleasure, Leisure, and Treasure\n\n<size=45>44 Bathroom Slip-Up</size>",
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			say = "Prinz Adalbert invites me to her cabin, and I naturally take her up on that.",
			bgm = "story-niceship-soft",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			say = "As soon as I enter, the first thing I see is...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Oof, ouch...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "...The bathroom door, wide open.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Soap suds are practically flooding out of there, soaking the cabin carpet.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Prinz Adalbert herself is a veritable mountain of bubbles. When she fell, her towel slipped right off.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "(Help her up.)",
					flag = 1
				},
				{
					content = "(Ask what happened.)",
					flag = 2
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "(I'm curious how she ended up this way, but first, I'd better help her up.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I decide to go in there and help the poor girl.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Oh, Commander! Be careful. It's slippery in here. You don't want to end up on your butt like I just did...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Wow, you've got good balance. Could you bring me that shampoo while you're at it?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Okay.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "When I turn around to get the shampoo, I step on a bar of soap concealed by the bubbles.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "And then...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Whoa! Careful, Commander!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Oh, no... Down goes another.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Are you okay? Hmm... Should I be the one to help you up? I can crawl over.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "No, no, I'm fine. I don't want you falling a second time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Oh... Riiight. Okay, I'll stay right here. Good luck, Commander. I'm counting on you!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I manage to peel my upper half off of the slick floor and turn to face Adalbert, who's still sitting the way she was before.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Question. Why is the bathroom covered in suds?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Oooh, well, it's a funny story.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "When I saw that iceberg sinking earlier, I had a great idea. What if I could apply that same concept to my kickboxing?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Like, whoosh whoosh, bam!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "I thought it'd be fun to spar with you, so I called and invited you over.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Then I got bored waiting for you, so I got in the bath...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "But JUST bathing is boring, too, so I started looking for a way to have fun. You get how I feel, don't you?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "I just... didn't think it'd lead to so many bubbles.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Adalbert awkwardly dries her hair with the towel that's been sitting on her head.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Umm... Okay. You didn't get hurt, though?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Nope. I'm fine as can be.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "You really look concerned. Were you that worried about me?",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Of course I was.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Heheh... Thanks. I'm fine, though. C'mon, let's play in the bubbles together.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Before I can comprehend her offer, she grabs a nearby clump of bubbles...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "...And she throws them at me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Direct hit! One point to Prinz Adalbert!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 30,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Seeing her joy infects me and rouses my playful side in turn.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Take this!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "The bathroom becomes an even bigger mess of bubbles.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Phew... Not bad, Commander.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "......",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Aww, nice. You finally smiled!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Hm?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "You've been taking things so seriously today. I realized I haven't seen you smile much.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "So it's a relief to see those pearly whites now.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			actorName = "{playername}",
			hideRecordIco = true,
			actor = 900435,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Is that the whole reason you invited me here? You wanted to spar with me and... make me smile?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Hmm... You're right about making you smile, but I was never actually going to kickbox with you.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "Uh, what was I trying to do, again...? Eh, forget it. I got the smile I wanted anyway.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "And look. You're all soaked now, Commander. Guess we gotta take a bath together!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_146",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900435,
			say = "I'll wash that back good and clean for you.",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
