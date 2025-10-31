return {
	id = "ISLANDDAILYTASK14",
	mode = 10,
	map = {
		{
			100900,
			10070012
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
			animation = "doubt",
			characterId = 100900,
			subName = "Manager of Production",
			say = "Is all of it done already?",
			face2Face = {
				{
					0,
					100900
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of Production",
			characterId = 100900,
			say = "Yep, looks like there weren't any issues with the manufacturing equipment.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100900,
			subName = "Manager of Production",
			say = "That's good. Let me know whenever you want to make something.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
