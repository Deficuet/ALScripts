return {
	id = "ISLANDDAILYTASK1",
	mode = 10,
	map = {
		{
			100700,
			10040002
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
			animation = "nod",
			characterId = 100700,
			subName = "Manager of the Forest",
			say = "Thank you so much, Commander.",
			face2Face = {
				{
					0,
					100700
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "I will manage the logging site carefully from this point on!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Forest",
			characterId = 100700,
			say = "Now nobody has to worry about lacking wood anymore.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
