return {
	id = "ISLANDDAILYTASK11",
	mode = 10,
	map = {
		{
			100100,
			10010041
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
			characterId = 100100,
			subName = "Manager of the Mill",
			say = "Zzz... Hm? Commander... You got the things needed for the water mill...",
			face2Face = {
				{
					0,
					100100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100100,
			subName = "Manager of the Mill",
			say = "Okay, just... Leave them over there. Thanks...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mill",
			characterId = 100100,
			say = "Now I can sleep a little longer...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Mill",
			characterId = 100100,
			say = "Zzzzz...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
