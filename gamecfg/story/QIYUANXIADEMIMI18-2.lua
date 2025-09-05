return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIYUANXIADEMIMI18-2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			bgm = "battle-tulipa",
			side = 2,
			bgName = "star_level_bg_305",
			nameColor = "#A9F548FF",
			say = "KABOOOM!",
			soundeffect = "event:/battle/boom2",
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
			portrait = 205140,
			side = 2,
			bgName = "star_level_bg_305",
			nameColor = "#A9F548FF",
			dir = 1,
			actorName = "Royal Oak",
			say = "Knights of the Enduring Fortress, form up and eliminate these invaders!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			dir = 1,
			actor = 801050,
			say = "Huh? Reinforcements here, of all places?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			dir = 1,
			actor = 807020,
			say = "Do you think it's the exploration team that got trapped on the third layer?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = 205110,
			side = 2,
			bgName = "star_level_bg_305",
			nameColor = "#A9F548FF",
			dir = 1,
			actorName = "Revenge",
			say = "Step aside, lost adventurers. We will handle the rest.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actor = 803030,
			say = "Yes, leave this to us.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 0,
			bgName = "star_level_bg_305",
			actor = 801050,
			dir = 1,
			actorName = "Le Hardi &   Duquesne",
			hideOther = true,
			nameColor = "#A9F548FF",
			say = "- Duquesne?! - YOU?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			subActors = {
				{
					expression = 5,
					actor = 803030,
					paintingNoise = false,
					hidePaintObj = false,
					dir = 1,
					pos = {
						x = 1125,
						y = 0
					}
				}
			}
		},
		{
			expression = 4,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actor = 803030,
			say = "Why are you here? And the Commander, too... Thank goodness. I always hoped you were safe.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			dir = 1,
			actor = 205140,
			say = "Huh? Are they friends of yours?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actor = 803030,
			say = "Comrades in battle, and reliable mages at that.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 205110,
			side = 2,
			bgName = "star_level_bg_305",
			nameColor = "#A9F548FF",
			dir = 1,
			say = "Reliable mages... But they look so young. I guess you can't judge a book by its cover.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 803030,
			side = 2,
			bgName = "star_level_bg_305",
			nameColor = "#A9F548FF",
			say = "Allow me. These two are Royal Knights who've protected the Enduring Fortress with me all this time, Royal Oak and Revenge.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actor = 803030,
			say = "Let's discuss details after we've dispatched of the invaders.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_305",
			say = "There's a twinkle in her eye, as if she has some hidden motive.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			portrait = "zhihuiguan",
			say = "(Now may not be the time to interrogate her, but that's fine. I have a strategy guide anyway.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actorName = "Codex Magicus",
			hideRecordIco = true,
			say = "Location: The Enduring Fortress. A stronghold shrouded in mystery.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actorName = "Codex Magicus",
			hideRecordIco = true,
			say = "Organization: Royal Knights, a group shrouded in mystery.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actorName = "Codex Magicus",
			hideRecordIco = true,
			say = "Character: Royal Oak, a mysterious Royal Knight.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actorName = "Codex Magicus",
			hideRecordIco = true,
			say = "Character: Revenge, a mysterious Royal Knight.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "story_tablet",
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actorName = "Codex Magicus",
			hideRecordIco = true,
			say = "Character Supplement: Duquesne, a member of the 91st Exploration Team. For mysterious reasons, she's now a member of the Royal Knights.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			portrait = "zhihuiguan",
			say = "(Impressively... mysterious, I guess.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "Infernal Deviljuu",
			bgName = "star_level_bg_305",
			nameColor = "#FF9B93",
			say = "TWEEVIL TWEEVIL!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 3.7,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							-280
						},
						{
							1500,
							-280
						}
					}
				},
				{
					time = 2.8,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1000,
							0
						},
						{
							1600,
							0
						}
					}
				},
				{
					time = 3.5,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							350
						},
						{
							1500,
							350
						}
					}
				},
				{
					time = 3,
					name = "jiulaimu_emo",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1200,
							-350
						},
						{
							1600,
							-350
						}
					}
				}
			}
		},
		{
			expression = 6,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_305",
			side = 2,
			actor = 803030,
			say = "An enemy swarm! Commander, watch out!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
