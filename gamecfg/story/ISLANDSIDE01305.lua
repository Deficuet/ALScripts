return {
	id = "ISLANDSIDE01305",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			characterId = 0,
			say = "The storage was a real mess, but I did manage to find some fertilizer.",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "That's great! I'll mark it in my logs.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Thanks for the help.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "You're welcome. I'm just glad to be able to assist you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			withoutIcon = true,
			withoutName = true,
			say = "I'd better bring this fertilizer back to Laconia now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
