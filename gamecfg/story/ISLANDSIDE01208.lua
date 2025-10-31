return {
	id = "ISLANDSIDE01208",
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
			animation = "rest",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Whew. You're a big help.",
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
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Thanks, Commander. Give my thanks to Lusitania as well.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101200,
			subName = "Manager of the Café",
			say = "Also, I've got a little something for you.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Café",
			characterId = 101200,
			say = "Take this citrus coffee and share it with Lusitania!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
