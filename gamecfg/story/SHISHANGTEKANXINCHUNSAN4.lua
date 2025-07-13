return {
	fadeOut = 1.5,
	mode = 2,
	id = "SHISHANGTEKANXINCHUNSAN4",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			hideRecordIco = true,
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			bgm = "story-chunjie2025-1",
			actor = 503011,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "I open the door to Chien Wu's room, where she's hard at work adjusting her dress.",
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
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She notices my arrival, turns around, and grins slightly.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = "login",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "You're here quite early. That excited to see my outfit?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "Heh. That look on your face tells me that you see the value of my design. Your fashion sense isn't half bad.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "You put a lot of work into this.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "As always, your design is more than stunning.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = "main1",
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Chien Wu gives a slight grin at my praise, but she remains fully focused on the dress.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "There's still some time. Let's set out once I've finished these details...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Seemingly to check the fit, she gathers the fabric at her chest and then lifts the dress slightly.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "The dress hugs her figure, highlighting a charming and elegant silhouette.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She turns to the side, contemplating herself in the mirror. She then starts adjusting the button and strap positioning...",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Just then, she seems to remember something and gazes at me.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = "main2",
			dir = 1,
			nameColor = "#A9F548FF",
			say = "You're free, aren't you? Don't just stand there, come help me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "(Offer tea.)",
					flag = 1
				},
				{
					content = "(Offer to help her adjust the dress.)",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "Want me to brew you some tea, or something?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_146",
			withoutActorName = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 503011,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "She nods, accepting my offer.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "Hm? Want me to help you with the dress?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			dir = 1,
			optionFlag = 2,
			actor = 503011,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "I appreciate the offer, but no, I'd like to perfect my own work with my own hands.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			dir = 1,
			optionFlag = 2,
			actor = 503011,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "That said, since you're offering, why not brew me some tea?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Thus, I bring her a cup of freshly brewed tea. She savors it in an elegant manner.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			side = 2,
			say = "If you don't mind my asking, which of these perfumes do you think is the best for tonight?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She produces several bottles of perfume as if by sleight of hand and has me pick one.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "Hmm... This one left the deepest impression, I think. It seems perfect for such a special occasion.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "I see. It does match this outfit, too... Then I'll choose this one.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She happily accepts my suggestion and then looks at my clothes.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			live2d = "home",
			dir = 1,
			side = 2,
			say = "Your tuxedo looks a bit plain here. How about I go get some accessories to jazz it up?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She takes out an elaborate jewelry case, but there are so many inside that I struggle to decide which ones to choose.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "When I look to her for advice, my eyes stop on her delicate brooch.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She follows my gaze down to the brooch and grins in understanding.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "Oh, I see. So you like this one?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "Good taste. I happen to have some materials left over, so I'll make you one to match.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "With that, she takes out her tools and begins working with swift, deft movements.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Before long, she's made a beautiful brooch matching the one on her chest.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503011,
			actorName = "{playername}",
			live2d = true,
			say = "What attention to detail...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "Of course. We're going together, after all.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "I'm paying more attention to ensuring it complements your attire and that we match, rather than trying to just draw attention.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "After helping me adjust a few details, Chien Wu looks at our outfits with satisfaction, checks herself in the mirror once more, and then finally beams.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = "mission",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "It's almost time. Let's be off.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 503011,
			say = "We don't want to miss the opening of the banquet.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "With that, we walk out of the room and head to the main hall together.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503011,
			side = 2,
			bgName = "star_level_bg_146",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "The subtle scent of perfume drifting from beside me adds an extra touch of magic to this wonderful night.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_146",
			say = "After the banquet, we go back to her room.",
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
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Chien Wu puts a hand on the door frame to support herself as she prepares to take off her heels. I see traces of exhaustion on her face.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "I'm done with work, so I plan to relax tomorrow...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "If you don't have any plans, why not stay with me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I'm given no time to consider the sudden offer before she takes off my tuxedo.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "You've been wearing that all night. Surely it feels stuffy by now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Then, she leans in close and sniffs me.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "I smell my perfume on you... Maybe I stayed a little too close to you during the banquet?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She giggles and touches my collarbone.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "Commander, you feel a little hot... Is it all about the alcohol? Or something else? ♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503012,
			actorName = "{playername}",
			say = "Could be anything.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "I put on high heels and sacrificed comfort for the look tonight. Standing around for extended periods is pretty tiring...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Fatigue lingers in her voice, but there's an obvious hint of flirtation.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "Don't just stand there. Help me out...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "When I unconsciously reach for her shoes, she acts surprised for a moment.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "I meant support me, silly.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "What? You want to take my shoes off for me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503012,
			actorName = "{playername}",
			say = "Oh, that's what you meant...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "(Support her.)",
					flag = 1
				},
				{
					content = "(Take her shoes off.)",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 503012,
			actorName = "{playername}",
			say = "Okay, okay. I'll help you balance.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "I give her my shoulder, and she leans on me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			optionFlag = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "I was hoping you'd be more assertive, but you're still so slow to act...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			optionFlag = 1,
			hideRecordIco = true,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "She chuckles and looks up at me, a mischievous glint in her eyes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 503012,
			actorName = "{playername}",
			say = "I mean, may I?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "Either amused... or stunned, she doesn't pull her leg away.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			optionFlag = 2,
			nameColor = "#A9F548FF",
			say = "Heehee... Sure. Do what you want.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			optionFlag = 2,
			hideRecordIco = true,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "She then looks up at me, a mischievous glint in her eyes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "Since you're free, Commander, why not give me a massage...?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "You're already trying to touch me, after all.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 503012,
			actorName = "{playername}",
			say = "Sure. I'd be happy to.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I nod and prepare to massage her feet.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She rests her hand on the door frame, her expression relaxed and at ease.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "You want to peel off my stockings?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "Ah, you and your tedious ideas... Fine, come here ♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I gingerly pinch the edge of her stockings and pull them down.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "The silk texture has a soft sheen under the light, making her ankles appear even more delicate and slender as I slowly slip them off.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "*sigh*... Honestly, we don't often get to spend time together like this...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "Ah, that spot tickles... Eep?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			hideRecordIco = true,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "She pulls her foot away to escape my hands, nearly losing her balance in the process.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "As I manage to catch her just in time, I accidentally step on the train of her dress.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "That's not good. Yes, I suppose keeping this dress on might be inconvenient later...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She pauses for a moment and then smiles meaningfully.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "Heehee... Look at you. What were you just imagining?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			actor = 503012,
			nameColor = "#A9F548FF",
			say = "Is there something special you want to... do during this rare time together?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 503012,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_146",
			spine = true,
			dir = 1,
			side = 2,
			say = "If you can please me... then yes, I might just be willing to do it. ♥",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
