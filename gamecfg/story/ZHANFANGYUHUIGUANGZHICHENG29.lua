return {
	id = "ZHANFANGYUHUIGUANGZHICHENG29",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			say = "Martyrium Core - At the Basilica",
			bgm = "theme-thehierophantv",
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
			expression = 4,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 805030,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "One will now secure the path to the crystal!",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
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
			expression = 7,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "This is as far as you go, youngling.",
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
			bgName = "bg_huiguangzhicheng_5",
			actor = 901070,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "The META Hatakaze...",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 805030,
			dir = 1,
			nameColor = "#5CE6FF",
			say = "Commander, Hatakaze spotted! Requesting orders!",
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
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			nameColor = "#5CE6FF",
			say = "That really is the control center, then. Rodney's been neutralized! It's about time you surrender!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "Heheh, heheheh... You never cease to amaze.",
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
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "But you seem to have forgotten something. Control of the Martyrium is still in my hands.",
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
			bgName = "bg_huiguangzhicheng_5",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "Is it really, now?",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_camelot_15",
			say = "After a burst of dazzling light, another structure appears above the holy icon – the gate of Camelot.",
			bgm = "theme-elizabeth-andmeta",
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
			expression = 8,
			side = 2,
			bgName = "bg_camelot_15",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "Wha–?!",
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
			expression = 2,
			side = 2,
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "Our train is still parked at Camelot. Mirror Sea or not, did you think that a single car could carry more information than the entire train?",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "We were only reluctant to use this method because we wanted to avoid damaging the train.",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "You've appeared in person, and our servant has already cleaned up the corrosion of the Mirror Sea.",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_camelot_15",
			nameColor = "#FFC960",
			dir = 1,
			say = "How, pray tell, do you expect to control this place?",
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
			bgName = "bg_camelot_15",
			actor = 9705040,
			dir = 1,
			nameColor = "#FFC960",
			say = "\"In this glorious celestial orbit, there is but one train.\" Get out of our train!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "Kh...!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = false,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = false,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
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
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_5",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "Test site beta... I won't forget this!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_4",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "Blundering like this on the final step...",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_4",
			actor = 9701030,
			dir = 1,
			nameColor = "#BDBDBD",
			say = "I admit defeat. But rest assured, you have not won!",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "You've said enough, rat!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "jinguang"
				}
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_3",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Now, with a little cleaning, that corrosion problem will be as good as gone!",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "jinguang"
				},
				{
					active = false,
					name = "memoryFog"
				}
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "The holy icon in the center of the Martyrium spreads its wings once more.",
			bgm = "theme-lightheven",
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
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "This time, the crystal exudes a holy light that shines upon the city.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "Under the power of the Iris, the complex loses its source of corrosion and turns to ash. Before long, the Mirror Sea is purified.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9705040,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Phew... Perfect.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "All that's left is to recover the whale–",
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
			side = 2,
			actorName = "The Whale",
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			shakeTime = 5,
			nameColor = "#5CE6FF",
			say = "......",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			movableNode = {
				{
					time = 4,
					name = "unknownV_boss_death_1",
					spine = {
						action = "move",
						scale = 1
					},
					path = {
						{
							-1500,
							-500
						},
						{
							2500,
							-300
						}
					}
				}
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "That was my whale calling!",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "Gaaaaah! The whale! My whale's running away again!",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "An earsplitting roar accompanies the whale's ascent into the Martyrium sky.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 805030,
			say = "Death's Shadow is defeated. If Miss D doesn't have control of the whale, then who could possibly...",
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
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "Damn it! Devil?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "She lay in hiding all this time just to make us fight Hatakaze so she could steal the whale at the last minute?!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "She played us like a fiddle!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "As cunning as ever... Had us fooled, too.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "Likewise. I'm sorry...",
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
			expression = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "Nuh-uh! No apologizing right now!",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "Whale time! Follow that whaaale!",
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
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Wait! We need to recover the train car first!",
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
			expression = 4,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "Forget the damn train! Whale, whale, whale!",
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
			expression = 10,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "WHAAAAALE!",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Ugh... Fine!",
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
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "Let's get back to the Queen's Light first.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "Hold on. I can't let you go, Commander.",
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
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "Helena?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Agreed. This pursuit is fraught with danger. It isn't part of the original plan.",
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
			actor = 9705040,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Commander, return with the Iris fleet. Be careful on the way – you're in a battlefield until you're home.",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "Elizabeth dismisses me before I can speak up. Then, she thrusts a small pamphlet into my hands.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "An instruction manual on the gate of Camelot. Use it as directed, and you will make it to test site beta just fine.",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "That isn't necessary. I can teach the Commander myself.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Why must you argue over this... Fine. Do as you please.",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "......",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "The Martyrium can't be left in this state.",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "Such an enormous spatial impact event will attract other factions before long. We have to eliminate all traces of it while we still can.",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "...I'll turn this Mirror Sea back into train cars and deliver it back to test side beta.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 9705040,
			say = "Much obliged. We leave it in your hands.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#5CE6FF",
			actor = 900430,
			say = "Bye, mysterious assistant! See ya later!",
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
			nameColor = "#5CE6FF",
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			say = "While the Queen's Light disappeared – a few cars lighter than it had arrived – the Ashes prepared to depart as well.",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "That resculpted META Rodney isn't a threat anymore.",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "I doubt she'll come with us. Mind if we leave her with you, Helena?",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "Not at all. Are you two going already?",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Yeah. Hunting down Arbiters isn't our job.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "We confirmed the cause of the spatial impact event, so it's about time for us to go home.",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "...It was a pleasure to fight alongside you. You're as reliable as ever, Helena.",
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
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900315,
			say = "I have no idea what you're talking about.",
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
			expression = 6,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "Ahahahaha! Guess there's nothing to do but say goodbye, then!",
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
			actor = 900432,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Hope we meet again, Helena.",
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
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "And boy, do I hope I never run into you test site beta folk again.",
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
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "I'm afraid I can't make any guarantees there.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			nameColor = "#5CE6FF",
			say = "It's been an honor. Give Friedrich my regards.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			actor = 900432,
			say = "Will do.",
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
			actor = 900315,
			side = 2,
			bgName = "bg_huiguangzhicheng_6",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFC960",
			say = "Commander, take those girls back to Camelot. I won't be far behind.",
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
			blackbg = true,
			mode = 1,
			asideType = 1,
			bgm = "story-startravel",
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
			sequence = {
				{
					"Thus, our part in the impromptu hunting trip had come to an end.",
					2
				},
				{
					"Our visitors from other branches returned to their respective homes, too.",
					4
				},
				{
					"All with their own ideals in mind. All ruminating on the future.",
					6
				},
				{
					"All listening in to the distant voice echoing amidst the stars.",
					8
				}
			}
		}
	}
}
