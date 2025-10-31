return {
	id = "ISLANDSIDE01206",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "curious",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Fantastic, Commander! You've spread the fertilizer evenly and used neither too much nor too little.",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "You have green fingers, something I didn't expect!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Now, next step. Umm...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "With the fertilizer spread, could you please go and fetch some citrus tree seeds? We'll plan them right here!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Sure thing. I'll be right back.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
