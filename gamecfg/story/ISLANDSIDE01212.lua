return {
	id = "ISLANDSIDE01212",
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
			say = "That should be a wrap, shouldn't it?",
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
			say = "Yes! Now we can relax for a while and do what we wanted to.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Like for instance, having some of this!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Is that the citrus coffee Bremen made?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Indeed it is!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "We said we'd drink it after our work was finished, remember?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Without further ado – enjoy, Commander!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
