return {
	id = "YIHAILIUSHENG3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 1,
			blackBg = true,
			bgm = "theme-starsea-core",
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			sequence = {
				{
					"\"When viewed that way, this is our only choice...\"",
					0
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_bsmre_14",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "I know there are many questions on your mind after seeing Antiochus' plans and the sacrifices they've made.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				black = true,
				dur = 1,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_bsmre_14",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "But the Ashes' answer stayed the same. From beginning to end.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9702010,
			side = 2,
			bgName = "bg_bsmre_14",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "And so, the day of our surprise attack came.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9702010,
			side = 2,
			bgName = "bg_bsmre_14",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "I take it Renown and Repulse told you about what happened that day.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_bsmre_14",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "It's true. We took our swing, and we missed.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			say = "Somewhere, in an unknown location...",
			bgm = "battle-ash-strong",
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
			},
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			actor = 9702010,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "There... I'm in. Enterprise, I'm picking up a signal from what I believe is Zero! She must be here!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900072,
			nameColor = "#FFC960",
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			actorName = "Enterprise META",
			side = 2,
			say = "...All that's left is to pull the plug on the mainframe.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702020,
			say = "It won't be that easy. We've got several Arbiter vessels heading toward us.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702020,
			say = "They'll be here in... three seconds!",
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			nameColor = "#FFC960",
			side = 2,
			bgName = "bg_camelot_4",
			dir = 1,
			soundeffect = "event:/battle/boom2",
			actor = 900192,
			actorName = "Takao META",
			hidePaintObj = true,
			say = "Maintain formation! All ships, draw your weapons!",
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
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900287,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "We know about your little ambush attempt. The jig is up.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900286,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "Even had it succeeded, the outcome of this battle would still be the same.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900285,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "Now that your plan has failed, it's time to duke it out.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900327,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "I can't believe this was one of Antiochus' bloody experiments! Enterprise, Takao, we'll take care of the vessels!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900326,
			say = "Go after Zero! Hurry, Helena's hacking can't slow them down forever!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "More vessels approaching! Fusou, they're after you!",
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_camelot_4",
			dir = 1,
			soundeffect = "event:/battle/boom2",
			actor = 9705010,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "Understood. I shall see to their departures...",
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
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "Presumptuous insects. Your combined power amounts to nothing before us.",
			soundeffect = "event:/battle/boom2",
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
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9707010,
			say = "The Empress is here too, huh... That's how we know we're in the right place!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "Yes, and your overconfidence has led you to your doom. It seems you haven't learned from the past.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "I'll let you in on a secret. The Devil and Hierophant have taken control of your warp devices.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "Hanged Man and Death are converging upon you as we speak. Lovers, Moon, and Chariot will be here in five minutes. You fought so hard, only to be herded up like lambs to the slaughter. I pity you fools.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900072,
			nameColor = "#FFC960",
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			actorName = "Enterprise META",
			side = 2,
			say = "So many Arbiters vessels... It'll be tough, but we can do it. Zero's brought the whole party to defend her mainframe.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "It's funny you should say her name. Zero was never here to begin with.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900072,
			nameColor = "#FFC960",
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			actorName = "Enterprise META",
			side = 2,
			say = "...What?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "...Oh no. Memphis, carry out our evacuation plan!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "Enterprise, we need to break through this point to get out!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900072,
			nameColor = "#FFC960",
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			side = 2,
			actorName = "Enterprise META",
			say = "Don't. They might just be bluffing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900072,
			nameColor = "#FFC960",
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			side = 2,
			actorName = "Enterprise META",
			say = "If Zero really wasn't here, why put all these Arbiters here?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "I know, but–",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "Huh? What's this abnormal reading on my SG?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "Wait, is that...?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900191,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FF9B93",
			say = "The only zero here is your probability of victory.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900325,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actorScale = 1.5,
			say = "41 75 74 68 65 6E 74 69 63 61 74 69 6E 67 2E",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "languang"
				}
			}
		},
		{
			actor = 9702010,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Huh?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "memoryFog"
				}
			}
		},
		{
			actor = 900325,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actorScale = 1.5,
			say = "43 6F 6E 66 69 72 6D 2E",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900325,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actorScale = 1.5,
			say = "53 74 61 72 74 75 70 62 61 63 6B 75 70 70 72 6F 74 6F 63 6F 6C 2E",
			typewriter = {
				speed = 0.01,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 900325,
			side = 2,
			bgName = "bg_camelot_4",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#C3ABFF",
			actorScale = 1.5,
			say = "45 78 65 63 75 74 65 74 72 61 6E 73 70 6F 72 74 70 72 6F 74 6F 63 6F 6C 2E",
			typewriter = {
				speed = 0.01,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_1104",
			dir = 1,
			bgm = "bgm-waterwave",
			actor = 9702010,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "This feeling, is it...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = false,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_1104",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9702010,
			say = "...You, SG?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
