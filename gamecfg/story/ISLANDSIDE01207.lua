return {
	id = "ISLANDSIDE01207",
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
			subName = "Manager of the Orchard",
			characterId = 101100,
			animation = "elation",
			say = "Seeing these beautiful and ripe citrus fruits makes you feel like all our hard work up to now was worth it, doesn't it?",
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
			say = "Would you like to try one, Commander?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Let's have some after everything's done.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Sure! I'll leave it to you.",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Ah, right, Bremen said she has almost run out of citrus fruits.",
			characterId = 101100,
			subName = "Manager of the Orchard",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Orchard",
			characterId = 101100,
			say = "Could you please deliver these to her?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
