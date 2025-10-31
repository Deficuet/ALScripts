return {
	id = "ISLANDSIDE00708",
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
			characterId = 0,
			say = "Bremen, could you...",
			animation = "talk",
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
			animation = "amaze",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "What's that? Looking for a honey water recipe?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "One time, long ago, I tasted the best honey water ever. You wouldn't believe how good it was.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "I'll never forget that taste.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "I did write the recipe for it down back then, but I've got no idea where it ended up.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Give me a minute. I'll look around the kitchen.",
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
			characterId = 0,
			say = "Did you find the recipe?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Well, something hit me after a while of searching the kitchen from top to bottom.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "I think I might've left that recipe in a secret place somewhere in the commercial area.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You... Hid it there? Not at home?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Yep. The recipe's special to me, and I'm more likely to lose it if I keep it at home.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Not sure I follow your logic.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "At any rate, I can't leave the café for the moment. Sorry.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "If you tell me where the recipe is, I can go looking for it instead.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
