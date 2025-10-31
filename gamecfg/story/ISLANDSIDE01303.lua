return {
	id = "ISLANDSIDE01303",
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
			characterId = 0,
			say = "Laconia, the fertilizer you ordered got lost in an accident during transport.",
			animation = "talk",
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
			animation = "sad",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "I see... Thanks for finding that out for me, Commander.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "But, without that fertilizer... how will I fulfill my order?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Am I just... doomed?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "Don't give up. There's got to be another way.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "For example, you could order some more fertilizer.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Commander...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 101400,
			subName = "Manager of the Plantation",
			say = "No, you're right. I can't give up now!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Plantation",
			characterId = 101400,
			say = "Could you go see Patrick and ask her about more fertilizer?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Sure. I'll handle it.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
