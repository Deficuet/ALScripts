return {
	id = "ISLANDSIDE00901",
	mode = 10,
	map = {
		{
			100300,
			10020004
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
			animation = "hi",
			say = "Heard you called for me, Stephen. Need something?",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Oh, Commander! I was just about to go looking for you!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "See, I received this strange request from somebody.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Although it looks like a regular transport job at a glance, it just refuses to list what exactly the cargo is.",
			characterId = 100300,
			subName = "Manager of Logistics",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "It says you have to meet the client in person somewhere to discuss the specifics.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Talk about mysterious.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Since this is a local request that doesn't involve shipping, it's not easy to ask the client for an explanation, either.",
			characterId = 100300,
			subName = "Manager of Logistics",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Logistics",
			characterId = 100300,
			say = "I considered the possibilities, and in the end, you're the only one who can do this job!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Alright. I'll take it on. Where's the client?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "Manager of Logistics",
			say = "Uhh... It says, \"I'll wait at the mine in the plains.\" Know where that is?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Yep. I'll head there, then.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
