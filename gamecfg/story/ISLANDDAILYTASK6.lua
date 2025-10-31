return {
	id = "ISLANDDAILYTASK6",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Oh, you brought the ingredients I need.",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Yup, they look really good.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Now I can provide tastier food to our customers. Thanks a bunch.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "I'll be sure to pour extra love into the dishes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
