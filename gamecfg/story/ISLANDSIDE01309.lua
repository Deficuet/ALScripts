return {
	id = "ISLANDSIDE01309",
	mode = 10,
	map = {
		{
			100200,
			10020009
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
			say = "I've got the goods for the nursery lavender order.",
			animation = "talk",
			face2Face = {
				{
					0,
					100200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "note",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "Let me have a look... Yep, exactly the right amount!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Requests",
			characterId = 100200,
			say = "I was starting to think this order wouldn't come in time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100200,
			subName = "Manager of Requests",
			say = "But, even though it was down to the wire, a delivery is a delivery! Great work!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
