return {
	id = "ISLANDDAILYTASK18",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			animation = "hi",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "You're here, Commander... Sorry I made you do all that work.",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "It's fine. What is this? Food for those little cats?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Yep. Dried fish made just for them and divided into equal portions.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "I see them around often, so I want you to feed them.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Got it. Anything particular I should know?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Well, you might need to go looking for 'em. I'm not sure where they went, either.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Alright. I'll head out now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Appreciate the help, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
