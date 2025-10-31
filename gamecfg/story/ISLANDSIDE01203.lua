return {
	id = "ISLANDSIDE01203",
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
			animation = "nod",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Wonderful! Now I can continue pruning these branches.",
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
			characterId = 0,
			say = "Be sure to give them back to Homeric once you're done.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Of course. I was planning on having O'Brien make me a new pair.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "It's just that... Well...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'll go ask O'Brien about it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Oh, you'd do that for me? Thank you dearly!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
