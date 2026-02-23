return {
	fadeOut = 1.5,
	mode = 2,
	id = "DATEALANEGUANQIA8",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_dal2",
			hidePaintObj = true,
			say = "After a joint attack from Fraxinus AL, the Eagle Union, the Orthodoxy, and the Empery, all the enemies in sector two were wiped out.",
			bgm = "dal-az-theme",
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
			expression = 5,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500010,
			say = "Hm? This doesn't feel quite like the Fraxinus I'm used to.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"Aboard Fraxinus AL - Control Room",
				3
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
			expression = 3,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500030,
			say = "Let's just say some things happened. Do call it \"Fraxinus AL.\" Oh, and welcome back, Tohka.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 11500010,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "It's good to be back, Kotori.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500010,
			say = "You – I presume you're {playername}, the port's Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500010,
			say = "My name is Tohka Yatogami. It's quite an important name, so do try to remember it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_211",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 11500010,
			say = "I will need your assistance for the foreseeable future. On that topic... I'm hungry. Do you have anything to eat?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
