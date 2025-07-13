return {
	fadeOut = 1.5,
	mode = 2,
	id = "SHISHANGTEKANXINCHUNSAN3",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_175",
			say = "On the night before the festival, during my tour around the port, I hear a sudden commotion from a nearby building.",
			bgm = "story-china",
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
			bgName = "star_level_bg_175",
			say = "Curiosity compels me to check.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_175",
			say = "As I push open the half-closed door, what I find leaves me dazed.",
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
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "It's Nagato. She's wearing a traditional Dragon Empery dress, and her hair spills onto the table she's sitting on...",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Her arms are bound behind her head with red string, leaving her almost unable to move.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			side = 2,
			say = "C-Commander? What are you doing here...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "When she sees me, her face flushes.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "I-I simply wanted to help everyone prepare for the festivities...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "But I can't... untie this damn string...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "Nagato?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I can kind of imagine what she was trying to do, but I can't help but tease her a little.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			side = 2,
			say = "Th-this is...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "Well, I was planning to use the red string to make a good luck decoration for you...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "If only I knew it would lead to this embarrassment...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She flails her arms and legs about, but her efforts don't loosen the string.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Commander? Are you going to help me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "(Help her.)",
					flag = 1
				},
				{
					content = "(Suggest cutting the string.)",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "I'll help you untie it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			optionFlag = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "Mgh... Thank you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "Should I look for scissors?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			optionFlag = 2,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "Urk... I'd rather not cut it, if possible...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "Oh, right. You wanted to make it a decoration...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			optionFlag = 2,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "Yes...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I squat down and start untying the string wrapped around her.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "Hmm... Do we start with the legs or the arms?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Nagato turns her face away in embarrassment, doing her best not to watch me untie her.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "I... I want to be part of the ceremony and offer my blessings to you and everyone else...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			side = 2,
			say = "But no matter how many times I tried to fix it, the string just got tighter and more tangled.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "In a bid to dispel the awkward silence, she starts muttering quietly.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Despite my attempts to free her, it doesn't take long before I realize my hands have ended up entangled with her legs.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "They say this red string not only brings fortune but also attracts predestined lovers.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "I suppose... the two of us are bound by the red string of fate, then...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			side = 2,
			say = "Ah...! G-goodness, what am I saying?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "I look up at her face. She's beet red.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She struggles and writhes more out of shame, but it only makes things worse, tangling the string around us even more.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 305055,
			actorName = "{playername}",
			say = "Don't move, Nagato! Let's take it slow and steady.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			actor = 305055,
			nameColor = "#A9F548FF",
			say = "Aah... I just...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "After much effort, I manage to untie her ankles. As I stand up to free her arms too, however...",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_175",
			spine = true,
			dir = 1,
			side = 2,
			say = "Y-your hands are quite warm...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "She quivers and flushes again.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "With each knot I untie, the distance between us shrinks even more.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 305055,
			side = 2,
			bgName = "star_level_bg_175",
			spine = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "Nagato looks up at me, her eyes brimming with shyness and, strikingly, a trace of expectancy.",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
