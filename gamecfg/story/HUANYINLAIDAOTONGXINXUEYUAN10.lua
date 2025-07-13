return {
	fadeOut = 1.5,
	mode = 2,
	id = "HUANYINLAIDAOTONGXINXUEYUAN10",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "A short time after the start of the victory celebration, I remember something I'd totally forgotten.",
			bgm = "story-richang-1",
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
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "Due to the events in the control room, I still haven't finished doing a head count of the rescuees.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "本段光辉配置l2d"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "Now that I'm looking again, it seems Illustrious is still somewhere in the academy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "{playername}",
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "(Hmm... I'll let the others rest and go look for her myself.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			say = "Before long, I find her in a prep room.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "login",
			say = "Oh, Commander? Is something the matter? You look awfully tense.",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Hmm? Uh, have you not run into anything weird or heard any strange sounds?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Strange sounds, you say?",
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
			live2d = true,
			side = 2,
			bgName = "star_level_bg_166",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "She blushes a little awkwardly.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Are you saying you... heard something through the door?",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Well, it's not a big deal. Umm, I was just practicing singing lullabies for the kids...",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "(It's almost as if she's been so focused on her practice here that she genuinely didn't realize anything was wrong.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "(Hmm... I'll find a more appropriate time to fill her in.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Lullabies, huh?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "main1",
			say = "Yes. I bought a book on childcare recently. It's the one on the desk over there.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "It says that learning songs to help soothe them is especially important...",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Oh, I see. You've been practicing here all this time to help take better care of the kids in the academy?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "touch",
			say = "Just so. Honestly, I meant to do it in secret so it would be a surprise to everyone...",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "But doing it alone makes it impossible to get feedback on my progress...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "What if you had a partner?",
					flag = 1
				}
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "You'd like to join me? Heehee, that's wonderful.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Then I'll need a moment to think about what part you can help me with.",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Aren't you just singing lullabies?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "mission",
			say = "Not at all. If I was only singing, then I wouldn't need to practice here in secret.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "...I have an idea. Come over here for me, Commander.",
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
			live2d = true,
			side = 2,
			bgName = "star_level_bg_166",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I go to Illustrious's side as directed. She smiles gently and puts a hand on my back.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			live2d = true,
			side = 2,
			bgName = "star_level_bg_166",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Then she pats it gently... Once, twice.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "main2",
			say = "How does it feel, Commander? The book said that you can calm a child quickly with slow, gentle pats on the back.",
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
			dir = 1,
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I feel her soft exhales on me. Those, and her patting, are so comforting that I feel a sudden bout of sleepiness.",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Yeah, that... That works pretty well...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Are you sleepy, Commander? Would you like to take a little nap in my arms?",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "But I'm supposed to give you feedback on your practice. I can't just fall asleep now...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "headtouch",
			say = "Heehee, it's okay. We have plenty of time. After you wake up, we can start in earnest.",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "Okay...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			live2d = true,
			side = 2,
			bgName = "star_level_bg_166",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "After a moment's hesitation, I decide to take this opportunity to tell her about everything that happened today.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "If I don't go back soon, everyone will get worried...",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "main1",
			say = "I had no idea... I was so focused on my practice that I didn't notice anything had happened at all.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "You came looking for me because you were worried, and I just made you help me practice...",
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
			live2d = true,
			side = 2,
			bgName = "star_level_bg_166",
			withoutActorName = true,
			hideRecordIco = true,
			actor = 207037,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "She seems both embarrassed and apologetic.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "I could've told you before, but I chose not to. It seemed wrong to worry you over nothing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "How about we go back now? As for the rest of your practice...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "I know. Let's set a date.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "main3",
			say = "A date?",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_166",
			live2d = true,
			hideRecordIco = true,
			actor = 207037,
			actorName = "{playername}",
			hidePaintObj = true,
			say = "After the party is over, I'll come back and help you with your practice. Sound good?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "Heehee, sure.",
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
			actor = 207037,
			side = 2,
			bgName = "star_level_bg_166",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			live2d = "touch",
			say = "Once the party is over... we can go over every last little trick I've learned. Together♪",
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
