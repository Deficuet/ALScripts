return {
	id = "ISLANDSIDE00303",
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
			characterId = 0,
			say = "John!",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Oh, Commander. Here to buy some ore?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Sorry, but I can't help you right now. Bremen said the base's servers broke again. People are freaking out over there.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "See, that's the thing. I've got the bauxite we need to repair them.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "Whoa! Seriously?! One, two, three... This is more than enough! And it's pure!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Thank god you got here, Commander. Although, there's another problem – the parts I ordered earlier are still sitting in the harbor.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100600,
			subName = "Manager of the Mine",
			say = "You're the only one I can ask, so... could you go there and look for them?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright. I'll head right to the cargo pier. You just focus on preparing the components for repair.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
