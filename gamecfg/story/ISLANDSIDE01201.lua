return {
	id = "ISLANDSIDE01201",
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
			characterId = 0,
			say = "What's wrong, Lusitania? You look like something's weighing on you.",
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
			animation = "amaze",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Oh, Commander. Could you help me with something?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "My pruning shears unfortunately broke... Could you ask Homeric if she'd lend me hers?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "I still have so much I need to do around the orchard, so I can't step away right now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "No problem. I'll go see her now.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Thank you, truly!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
