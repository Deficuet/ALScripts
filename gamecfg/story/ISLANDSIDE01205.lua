return {
	id = "ISLANDSIDE01205",
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
			animation = "embarrass",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "Ahaha... Yes, come to think of it, I haven't.",
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
			say = "Once I'm finished with my work, I'll definitely go and buy some replacements!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You've still got work to do? Let me help.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "Manager of the Orchard",
			say = "How kind of you! What a fortuitous day this is!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Allow me to thank you by growing some premium-grade fruit for you!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Although, to cultivate delicious fruit, you need to scatter ample fertilizer. Could I ask you for help with that?",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
