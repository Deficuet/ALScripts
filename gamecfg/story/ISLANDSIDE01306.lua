return {
	id = "ISLANDSIDE01306",
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
			animation = "hi",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "Welcome back, Commander. Is that... fertilizer?",
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
			say = "Thank goodness. I'll finish in time for the order!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "Although, it's going to be tight, time-wise...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Say, um, could you help me plant the lavenders?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "Sure.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "Thank you... If you take the north side, I'll take the south side.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "I just harvested the ripe lavenders, so let's get sowing.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
