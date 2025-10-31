return {
	id = "ISLANDSIDE00710",
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
			say = "Bremen, I got your recipe.",
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
			animation = "nod",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Yeah! That's the one!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "I can almost taste that honey water just from looking at this recipe again.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "It's so good that I wish you could taste it right now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Only problem is... I need fresh lemon, honey, and some rosemary.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "As it so happens, my café's out of stock on those ingredients.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "I mean, we should be able to find all those on the island.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Yep. If you can't find any, go hit up Am-Mer-Mar in the commercial area. She ought to know where you'll find 'em.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
