return {
	id = "XIANGCHEYUTIANQIONGZHIYIN3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			asideType = 3,
			bgm = "story-dailyfuture-soft",
			sequence = {
				{
					"??? - ???",
					1
				},
				{
					"???",
					2
				}
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Skyscrapers, rising tall like a forest of trees. Cars and people, going to and fro.",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "A strangely familiar yet foreign scene leaps into my view as the light fades away.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "The city from the future... NY Harbor?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "The tension in my heart relaxes for a moment.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "It has to be said that this turn of events feels familiar.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "(Last time, it was in a simulation Helena ran using the Tower... Her goal was for us to get Yorktown's Type II rigging data.)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "(Could this be something similar?)",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "...Huh?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Just as I'm about to look around, I'm met with a puzzled look from a woman tilting her head.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "...Are we in NY Harbor?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
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
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I'm... You're... And this gear, it's... Wait, what?!",
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
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Did we... make it back?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "A realization seems to have hit her, her expression changes from confusion to joy, and she suddenly pulls me into a hug.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_port_ny_future",
			dir = 1,
			actorScale = 0.6,
			actor = 107160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "...Commander!",
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
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			},
			action = {
				{
					type = "shake",
					y = 10,
					delay = 0,
					dur = 0.1,
					number = 3
				},
				{
					delay = 1,
					dur = 0.35,
					type = "zoom",
					to = {
						0.8,
						0.8,
						0.8
					}
				},
				{
					type = "shake",
					y = 10,
					delay = 1.5,
					dur = 0.1,
					number = 3
				},
				{
					delay = 2.5,
					dur = 0.35,
					type = "zoom",
					to = {
						1,
						1,
						1
					}
				},
				{
					type = "shake",
					y = 10,
					delay = 3,
					dur = 0.1,
					number = 3
				}
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "As she breaks down in tears, I hold her tightly in my arms.",
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
			expression = 2,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Thank god... It's really you...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Finally... I finally get to see you again!",
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
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I knew it back then – that you'd be arriving soon with reinforcements...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I wanted to see you one more time...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "But it just wasn't possible...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "A Class IX would've been born if I'd just stood there...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "So I did what I had to...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Say, was Helena saved? Are Sara and the others all okay?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "No, I'm sure they all are...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "After all, you managed to save even me...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "So, what was that strange care pod? Did you procure it for me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "More importantly... How is the war going?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Seeing how at peace NY Harbor is, I can only assume our coastal waters are as safe as can be, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Hang on. Something's really not right here...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "We were in the base, weren't we? Why are we suddenly in the city?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			asideType = 4,
			mode = 1,
			spacing = 30,
			rectAlpha = 0,
			blackBg = true,
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"\"Wait...\"",
					0
				}
			}
		},
		{
			asideType = 4,
			mode = 1,
			spacing = 30,
			rectAlpha = 0,
			blackBg = true,
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"\"There is a problem...\"",
					0
				}
			}
		},
		{
			asideType = 4,
			mode = 1,
			spacing = 30,
			rectAlpha = 0,
			blackBg = true,
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"\"A serious problem...\"",
					0
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			actor = 0,
			say = "...Lexington.",
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
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "What's the last thing you remember?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "Well... I sacrificed myself to stop the Class IX mimic beast from fully materializing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "I have no idea what she's talking about.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Actually, to put it more aptly, I have no idea what she's saying, and it's entirely because of what I saw in that recording Helena left for me.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "What is the matter, Commander? You seem as confused as I am.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "She picks up on my confusion and the sense of distance between us.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "I want to reassure her, but my mind is a jumbled mess. I don't even know where to begin.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Do you... not... remember me?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Lexington, in her cleverness, immediately gets a broad idea of the situation from my hesitation.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I see... You forgot everything.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 107160,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "So this situation doesn't make sense to either one of us.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 10,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I don't know how I'm alive, and you don't know why you've lost your memories.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "And that's not even mentioning the question of why we're in NY Harbor...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Alright, what do you say we go and figure things out? Starting with your amnesia.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "If we take a walk around the city, you might remember something.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "Oh, wait, first I need to straighten my clothes, and put on new makeup.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Not only has she instantly pulled herself together and analyzed the situation, but she has also given me a bit of reassurance.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "It's her. The Lexington I know. I'm sure of it beyond the shadow of a doubt.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			asideType = 4,
			mode = 1,
			spacing = 30,
			rectAlpha = 0,
			blackBg = true,
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			rectMargin = {
				100,
				100,
				200,
				200
			},
			sequence = {
				{
					"\"However...\"",
					2
				}
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 107160,
			say = "I'm ready now! Shall we set off, Commander?",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "Although she puts on a smile, the faint trembling of her body betrays what's really on her mind.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "......",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_port_ny_future",
			hidePaintObj = true,
			say = "The last thing I'd do is ignore her when she's like this.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Okay. Let's get going.",
					flag = 1
				},
				{
					content = "Yeah. Let's set off.",
					flag = 2
				}
			}
		}
	}
}
