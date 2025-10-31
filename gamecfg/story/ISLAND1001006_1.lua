return {
	id = "ISLAND1001006_1",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			say = "John, we're back.",
			animation = "hi",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "And we have the wood.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Bravo! Nice work, you two. That's all the materials we need.",
			characterId = 100600,
			subName = "Manager of the Mine",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mine",
			characterId = 100600,
			say = "Now we can start repairing the bus stop!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Let us help you with that.",
			characterId = 100700,
			subName = "Manager of the Forest",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yeah. We'll get it done faster if we work together.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
