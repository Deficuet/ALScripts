return {
	id = "ISLANDSIDE00602",
	mode = 10,
	map = {
		{
			100500,
			10010003
		}
	},
	scripts = {
		{
			say = "Is this the place? These bite marks are fresh. I'll bet it was the sheep.",
			camera = "StoryCameraSideTask3",
			characterId = 0,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Moreover, look at this dirt.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Oh! Are those hoofprints?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Yeah. While they're a little hidden by the grass, they were definitely made by sheep hooves.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Judging by where they were heading, I think they went into those woods.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Th-the woods? What are they doing there?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Let's find out. I can still make out the hoofprints clearly, so they can't have gone far.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "You go back to the ranch and wait. For all we know, they might decide to go back soon.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Okay! I'll do as you say and wait there.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
