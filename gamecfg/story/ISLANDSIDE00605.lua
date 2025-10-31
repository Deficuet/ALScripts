return {
	id = "ISLANDSIDE00605",
	mode = 10,
	map = {},
	scripts = {
		{
			withoutName = true,
			camera = "StoryCameraSideTask1",
			withoutIcon = true,
			say = "I take out a fistful of sheep feed from the little bag I brought with me and slowly approach the sheep.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>The sheep raised its head warily, but upon seeing it was you and the feed it so loves, it lowered its guard a bit and approached carefully.</size>",
					2
				},
				{
					"<size=45>At the right time, you took the rope you brought with it and skillfully tied a loop around its neck.</size>",
					4
				}
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "There. Good girl. Don't worry, I'll take you home.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Let's go see Amerigo.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
