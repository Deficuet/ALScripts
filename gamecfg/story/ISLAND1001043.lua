return {
	id = "ISLAND1001043",
	mode = 10,
	map = {
		{
			101400,
			10050003
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
			say = "Laconia, my research has yielded fruit... so to speak.",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Okay?",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "Here's a preliminary cultivation guide.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "It includes the correct temperature and humidity for seedlings, proper sowing depth, and how to identify and deal with the most common pests.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Wow... I'll read every bit of it.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Good. The future of this plant nursery is in your hands.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Yeah... I promise I'll care for every last seed as if they were my babies.",
			characterId = 101400,
			subName = "Manager of the Plantation",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
