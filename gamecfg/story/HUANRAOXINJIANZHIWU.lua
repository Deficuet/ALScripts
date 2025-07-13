return {
	id = "HUANRAOXINJIANZHIWU",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_159",
			fontsize = 24,
			dir = 1,
			bgm = "story-richang-quiet",
			actor = 900459,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "My honourable Master would have noticed that last mistake.",
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
			expression = 6,
			side = 2,
			bgName = "star_level_bg_159",
			dir = 1,
			fontsize = 24,
			actor = 900459,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I need to practice more. To give you the ultimate performance you deserve...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_159",
			dir = 1,
			fontsize = 24,
			actor = 900459,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "This is my duty – my duty as a maid...! Right!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "When the performance ends, I come to the wings of the stage and find Sirius still hanging from the ring.",
			bgm = "story-richang-relax",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "She's muttering to herself. It's hard to tell if she's noticed me or not.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Sirius?",
					flag = 1
				},
				{
					content = "Sirius!",
					flag = 2
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Ah?! My honourable Master, how long have you been here...?",
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "No, I'm sorry. A mere maid mustn't ask such things.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "How did you enjoy the show?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Did my dance please you, my honourable Master?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "I loved it.",
					flag = 1
				},
				{
					content = "It was awesome!",
					flag = 2
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Ooh... It's such a joy to receive your recognition, my honourable Master!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "She looks over at me, swaying slightly as she maintains the same pose from the end of her show.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "It must be tiring to maintain that posture, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "The show's over... Why not come down already?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Well...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "When our eyes met at the end of the show, I became so nervous that, umm, I made an unexpected movement...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Some of my ribbons tangled... and I can't untie them...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "But do not worry, my honourable Master! I will have this problem solved in no time!",
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
					content = "(Rush to her aid.)",
					flag = 2
				}
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "I can't just leave her like this, so I move to help her untie the ribbons wrapped around her.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "My honourable Master, I couldn't trouble you to...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "O-oh, okay... Thank you... I apologize for my clumsiness.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "Given her lack of support or anything to hold on to, she sways when I touch her.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "It makes untying the ribbons a difficult task.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "This must make it difficult for you to help, my honourable Master... May I hold on to your shirt for support?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Go for it.",
					flag = 1
				},
				{
					content = "I'd be offended if you didn't!",
					flag = 2
				}
			},
			action = {
				{
					type = "shake",
					y = 0,
					delay = 0,
					dur = 0.4,
					x = 30,
					number = 2
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Okay. Pardon me...!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "Sirius stretches out her free hand and grabs my top.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "Her swaying abates. Eventually she stabilizes, but since she's using me for support, we're a lot closer to each other now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "D-don't you think we're a little too close, maybe...?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Or is this acceptable for you?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "No answer... Is this tacit acceptance?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "I think I might just be able to slip out now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "She lets go of my shirt, causing the ring to rock back and forth again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "Right after, a warm feeling touches my waist – she's wrapped her arms around me to stabilize herself again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "We're even closer than before now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			say = "And... the ribbons I just untied have all gotten tangled again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "It's going to take even longer to fix this mess.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "I'm so sorry, my honourable Master. I blundered again...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "But I understand that you're not angry with me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "Does that mean... you're okay with being this close to me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_159",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 900459,
			say = "You wouldn't mind staying like this for a while longer? Is that right, my honourable Master?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
