return {
	id = "ISLANDDAILYTASK13",
	mode = 10,
	map = {
		{
			101400,
			10050003
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
			animation = "talk",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "Thanks, Commander. This will make the bees happy, I'm sure.",
			face2Face = {
				{
					0,
					101400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "And, moreover...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shy",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "It makes me happy.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
