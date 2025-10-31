return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIWUYUTIANYUANZHISHANG14-2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			bgm = "battle-unknown-approaching",
			say = "KABOOOM!",
			soundeffect = "event:/battle/boom2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashN = {
				color = {
					1,
					1,
					1,
					1
				},
				alpha = {
					{
						0,
						1,
						0.2,
						0
					},
					{
						1,
						0,
						0.2,
						0.2
					},
					{
						0,
						1,
						0.2,
						0.4
					},
					{
						1,
						0,
						0.2,
						0.6
					}
				}
			},
			dialogShake = {
				speed = 0.09,
				x = 8.5,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "Fragments of nightmares, formless corruption, corrosion entities... They may look different, but they're the same at their core.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "The Cloudsea is as black as the night. It takes all our might to carve out a path through the black waves.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "They aren't much of a threat beyond having numbers on their side.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "Those numbers are precisely the issue, however.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			say = "We dispose of one after another, but however many we destroy, they always regroup in unseen nooks and attack us again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			spacing = 30,
			mode = 1,
			asideType = 4,
			blackBg = true,
			rectOffset = {
				700,
				700,
				700,
				700
			},
			sequence = {
				{
					"\"Like a fear that grows in the dark.\"",
					0
				}
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
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "Unzen, is this the corruption you spoke of? This horde is endless, and we cannot hope to defeat all of them ourselves.",
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
			actor = 303190,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "The ones we've defeated are but shadows. They will assail us endlessly until their source is removed.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "Please focus not on slaying them, but on clearing a path instead. We must reach Amahara Castle as soon as possible.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "Understood!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307010,
			say = "Be careful. Something even bigger is coming.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "???",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "▂▃▆▂▃▆▇▂▃▇█▆▆▇▇▆▇",
			fontsize = 60,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			movableNode = {
				{
					time = 1000,
					name = "chongying_u_boss02",
					spine = {
						action = "",
						scale = 1
					},
					path = {
						{
							300,
							-400
						},
						{
							0,
							-400
						}
					}
				}
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303200,
			say = "Is that... a black dragon?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "It bodes ill that such a wicked creature comes so soon...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 303190,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "We must fall back! This enemy is not like the rest. I shall cut it down!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "I-404",
			say = "Unzen! Minase, Taekaze, and I are here!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.25,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.25,
				dur = 0.25,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "I-404",
			say = "We'll take it from here! Take Commander {playername} and go to Amahara Castle!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "Command your seadrake to strangle this vile enemy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 317020,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actorName = "I-404",
			say = "Hmph. Got it!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303190,
			say = "Alright, the rest of us need to keep moving.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
