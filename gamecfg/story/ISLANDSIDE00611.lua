return {
	id = "ISLANDSIDE00611",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			say = "Amerigo, I brought the wood you need.",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "And I've got all the tools we'll need!",
			characterId = 100500,
			animation = "nod",
			subName = "Manager of the Ranch",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Great. Shall we get started?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Sure! Let's get to work!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>Sometime later...</size>",
					2
				}
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Amerigo, our wood supply's nearly out, but I just got done with my side!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Yup, I just finished mine, too!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Heh! Now the sheep can ram into these fences all day if they want, and they'll still never budge!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Thanks a bunch, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "You found all my sheep and even helped me reinforce the fences. I don't think there'll be another breakout anytime soon!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Still, don't get careless. You should inspect the fences every day to be safe.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "Yeah, yeah, I know!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Good. Go get yourself some rest. You've worked hard enough for a day.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Will do. See you later!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
