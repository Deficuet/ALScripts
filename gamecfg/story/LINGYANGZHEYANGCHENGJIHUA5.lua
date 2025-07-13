return {
	defaultTb = 2001,
	mode = 2,
	fadeOut = 1.5,
	id = "LINGYANGZHEYANGCHENGJIHUA5",
	placeholder = {
		"tb"
	},
	scripts = {
		{
			expression = 7,
			side = 2,
			bgName = "bg_project_oceana_room1",
			tbActor = true,
			actorName = "Navi",
			bgm = "qe-ova-2",
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "I see, I see. {tb}. That's what you want me to call you, huh?",
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
			bgName = "bg_project_oceana_room1",
			actorName = "Navi",
			tbActor = true,
			actor = 2001,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "Alright, then from now on, you're {tb}!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_project_oceana_room1",
			hidePaintObj = true,
			say = "And so, the curtains rose on Navi's and my time spent living together.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
