return {
	id = "ISLAND1001020_1",
	mode = 10,
	map = {
		{
			3120100,
			10070029
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
			camera = "StoryCamera5",
			say = "Hmm? The machine stopped working. I wanted to call more people in.",
			face2Face = {
				{
					0,
					3120100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 3120100,
			say = "Too bad, nya... The rules of the Singularity don't allow it. You have to wait between each permit you issue, nya.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "But don't worry! You'll have plenty of people helping out around the island before you know it, nya!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 3120100,
			say = "For now, let's go back to the harbor to meet our new development partner, nya!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
