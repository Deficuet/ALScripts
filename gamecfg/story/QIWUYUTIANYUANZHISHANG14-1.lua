return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIWUYUTIANYUANZHISHANG14-1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			say = "You mustn't go into Amahara...",
			blackBg = true,
			bgm = "story-darkplan",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "juqing_mengjing"
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
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "It's a grave. A grave made of lies and falsehoods...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "A prison that is completely sealed...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 900520,
			side = 2,
			nameColor = "#FEF15E",
			hidePaintObj = true,
			blackBg = true,
			say = "None can escape it...",
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
					"\"None can escape it.\"",
					0
				}
			},
			effects = {
				{
					active = false,
					name = "juqing_mengjing"
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_491",
			dir = 1,
			bgm = "story-temepest-2",
			actor = 307160,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "...Asama! Unzen!",
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
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "There is an alert from the Amahara Taijin! Invaders have appeared in the Sky Realm!",
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
			actor = 303200,
			say = "Invaders?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 303200,
			say = "How is it possible that they snuck through the Amahara Taijin?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 307010,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "We'll have to figure that out another time! This place is dangerous. We need to return to Amahara Castle at once.",
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
			say = "It's the corruption...",
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
			say = "It is already here...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 307160,
			say = "What?! Here?",
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
			say = "Tsk... Then we'll intercept! Don't let the enemy come close!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 102059,
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "I'll deploy a mass-produced ship at once. Commander, get on.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			actor = 102059,
			side = 2,
			say = "...Commander?",
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
					"\"None can escape it.\"",
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
			actor = 102059,
			side = 2,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			blackBg = true,
			say = "...Commander! Are you okay?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			blackBg = true,
			actor = 0,
			say = "I'm...",
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
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_491",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			blackBg = true,
			actor = 0,
			say = "I'm fine. Getting on now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
