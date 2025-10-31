return {
	id = "ISLAND1001004",
	mode = 10,
	map = {
		{
			100600,
			10040022
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			animation = "sad",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Aw, shoot! It's nowhere near enough! What do I do?!",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "Got a problem, John?",
					flag = 1
				}
			}
		},
		{
			say = "Oh, it's you! Perfect!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "scare",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "So, the deal is, the bus stop got utterly smashed, and I need a whole heap of coal to fix it, but I can't mine nearly enough of it all on my own, no matter how I try!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "You can't get enough, even in a mine? Don't you have a storage or something?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah, but it's all gone! My whole stockpile was just enough to cover a request for it. And then something crashed into the delivery before it could make it to the harbor...",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "*sigh*... I'm not gonna be done in time for this request.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "I'll help you.",
					flag = 1
				}
			}
		},
		{
			say = "Huh? You mean it? Heck yeah!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "amaze",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Of course I do. It's partly my fault that the transport network's down to begin with.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Well, I appreciate the help! You showed up at just the right time to save my bacon!",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Okay, let's get to work!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
